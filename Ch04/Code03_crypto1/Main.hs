import Data.ByteString.Char8 (ByteString, pack)

import Crypto.Hash

-- Cryptographic hashing

skein512_512 :: ByteString -> Digest Skein512_512
skein512_512 bs = hash bs

skein512_384 :: ByteString -> Digest Skein512_384
skein512_384 bs = hash bs

skein512_256 :: ByteString -> Digest Skein512_256
skein512_256 bs = hash bs

skein512_224 :: ByteString -> Digest Skein512_224
skein512_224 bs = hash bs

skein256_256 :: ByteString -> Digest Skein256_256
skein256_256 bs = hash bs

skein256_224 :: ByteString -> Digest Skein256_224
skein256_224 bs = hash bs

sha3_512 :: ByteString -> Digest SHA3_512
sha3_512 bs = hash bs

sha3_384 :: ByteString -> Digest SHA3_384
sha3_384 bs = hash bs

sha3_256 :: ByteString -> Digest SHA3_256
sha3_256 bs = hash bs

sha3_224 :: ByteString -> Digest SHA3_224
sha3_224 bs = hash bs

tiger :: ByteString -> Digest Tiger
tiger bs = hash bs

whirlpool :: ByteString -> Digest Whirlpool
whirlpool bs = hash bs

ripemd160 :: ByteString -> Digest RIPEMD160
ripemd160 bs = hash bs

sha512 :: ByteString -> Digest SHA512
sha512 bs = hash bs

sha384 :: ByteString -> Digest SHA384
sha384 bs = hash bs

sha256 :: ByteString -> Digest SHA256
sha256 bs = hash bs

sha224 :: ByteString -> Digest SHA224
sha224 bs = hash bs

sha1 :: ByteString -> Digest SHA1
sha1 bs = hash bs
 
md5 :: ByteString -> Digest MD5
md5 bs = hash bs

md4 :: ByteString -> Digest MD4
md4 bs = hash bs

md2 :: ByteString -> Digest MD2
md2 bs = hash bs

main = do
  let input = pack "haskell data analysis"
  putStrLn $ "Skein512_512: " ++ (show.skein512_512) input
  putStrLn $ "Skein512_384: " ++ (show.skein512_384) input
  putStrLn $ "Skein512_256: " ++ (show.skein512_256) input
  putStrLn $ "Skein512_224: " ++ (show.skein512_224) input
  putStrLn $ "Skein256_256: " ++ (show.skein256_256) input
  putStrLn $ "Skein256_224: " ++ (show.skein256_224) input
  putStrLn $ "SHA3_512: " ++ (show.sha3_512) input
  putStrLn $ "SHA3_384: " ++ (show.sha3_384) input
  putStrLn $ "SHA3_256: " ++ (show.sha3_256) input
  putStrLn $ "SHA3_224: " ++ (show.sha3_224) input
  putStrLn $ "Tiger: " ++ (show.tiger) input
  putStrLn $ "Whirlpool: " ++ (show.whirlpool) input
  putStrLn $ "RIPEMD160: " ++ (show.ripemd160) input
  putStrLn $ "SHA512: " ++ (show.sha512) input
  putStrLn $ "SHA384: " ++ (show.sha384) input
  putStrLn $ "SHA256: " ++ (show.sha256) input
  putStrLn $ "SHA224: " ++ (show.sha224) input
  putStrLn $ "SHA1: " ++ (show.sha1) input
  putStrLn $ "MD5: " ++ (show.md5) input
  putStrLn $ "MD4: " ++ (show.md4) input
  putStrLn $ "MD2: " ++ (show.md2) input
