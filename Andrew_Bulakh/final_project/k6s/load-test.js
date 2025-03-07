import http from 'k6/http';
export default function() {
  http.get('http://drupal.local');
  http.post('http://drupal.local/add', { username: 'test', email: 'test@example.com' });
};