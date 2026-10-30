// Zero-dependency Node server: static files from ./public + JSON API under /api
const http = require('http'), fs = require('fs'), path = require('path');
const PORT = process.env.PORT || 3000, ROOT = path.join(__dirname, 'public');
const TYPES = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css', '.json': 'application/json', '.svg': 'image/svg+xml', '.png': 'image/png' };
const api = {
  'GET /api/health': () => ({ ok: true, time: new Date().toISOString() }),
};
http.createServer((req, res) => {
  const url = new URL(req.url, 'http://x');
  const h = api[`${req.method} ${url.pathname}`];
  if (h) { res.writeHead(200, { 'Content-Type': 'application/json' }); return res.end(JSON.stringify(h(url, req))); }
  let p = path.normalize(path.join(ROOT, url.pathname === '/' ? 'index.html' : url.pathname));
  if (!p.startsWith(ROOT)) { res.writeHead(403); return res.end(); }
  fs.readFile(p, (e, d) => {
    if (e) { res.writeHead(404); return res.end('not found'); }
    res.writeHead(200, { 'Content-Type': TYPES[path.extname(p)] || 'application/octet-stream' }); res.end(d);
  });
}).listen(PORT, () => console.log(`http://localhost:${PORT}`));
