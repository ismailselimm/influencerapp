# Security & Secrets

- Never commit `.env` or keys. Use CI secrets + runtime config.
- Validate all inputs; sanitize HTML if rendering rich text.
- Pin TLS where possible; use OS keystore for tokens.
- Limit permissions (camera, location) to what is necessary.
