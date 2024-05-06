# Nightstick API

Base URL: `nightstick.jairah.online`

## Endpoints

### 1. Upload a file for scanning

- **Endpoint:** `POST /file`
- **Parameters:** 
  - `file` (multipart form-data): The file to be scanned.

### 2. Get a file report by hash

- **Endpoint:** `GET /hash`
- **Parameters:** 
  - `hash` (query parameter): The hash value of the file.

### 3. Scan URL

- **Endpoint:** `POST /url`
- **Parameters:** 
  - `url` (JSON): The URL to be scanned.

### 4. Get an IP address report

- **Endpoint:** `GET /ip`
- **Parameters:** 
  - `ip` (query parameter): The IP address to be scanned.

## Request Examples

### 1. Upload a file for scanning

```bash
curl -X POST \
  -F "file=@/path/to/your/file" \
  nightstick.jairah.online/file
```

### 2. Get a file report by hash

```bash
curl -X GET \
  nightstick.jairah.online/hash?hash=your_file_hash
```

### 3. Scan URL

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"url": "https://example.com"}' \
  nightstick.jairah.online/url
```

### 4. Get an IP address report

```bash
curl -X GET \
  nightstick.jairah.online/ip?ip=your_ip_address
```

## Response Format
The API responds with JSON data containing the scan results or an error message in case of failure.

### Success Response
```
{
  "result": "Scan result data"
}
```

### Error Response
```
{
  "error": "Error message"
}
```
