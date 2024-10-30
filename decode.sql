PRAGMA key = 'will_be_replaced_by_${DECODE_KEY}';

PRAGMA cipher_compatibility = 1;

PRAGMA cipher_use_hmac = off;
PRAGMA kdf_iter = 4000;
PRAGMA cipher_page_size = 1024;
PRAGMA cipher_hmac_algorithm = HMAC_SHA1;
PRAGMA cipher_kdf_algorithm = PBKDF2_HMAC_SHA1;

ATTACH DATABASE 'MicroMsg.db' AS plaintext KEY '';
SELECT sqlcipher_export('plaintext');
DETACH DATABASE plaintext;
