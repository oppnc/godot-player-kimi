# X509Certificate

> class X509Certificate
> inherits X509Certificate Resource

## Brief

An X509 certificate (e.g. for TLS).

## Description

The X509Certificate class represents an X509 certificate. Certificates can be loaded and saved like any other `Resource`.
They can be used as the server certificate in `StreamPeerTLS.accept_stream` (along with the proper `CryptoKey`), and to specify the only certificate that should be accepted when connecting to a TLS server via `StreamPeerTLS.connect_to_stream`.

## Methods

> method load(path: String) -> Error

Loads a certificate from `path` ("*.crt" file).

> method load_from_string(string: String) -> Error

Loads a certificate from the given `string`.

> method save(path: String) -> Error

Saves a certificate to the given `path` (should be a "*.crt" file).

> method save_to_string() -> String

Returns a string representation of the certificate, or an empty string if the certificate is invalid.

## Tutorials
- [SSL certificates]($DOCS_URL/tutorials/networking/ssl_certificates.html)
