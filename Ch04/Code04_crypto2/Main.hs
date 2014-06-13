import Crypto.Hash
import qualified Data.ByteString as BS

md5 :: BS.ByteString -> Digest MD5
md5 bs = hash bs

sha256 :: BS.ByteString -> Digest SHA256
sha256 bs = hash bs

sha512 :: BS.ByteString -> Digest SHA512
sha512 bs = hash bs

-- Applying a cryptographic hash to a file
main = do
  byteStr <- BS.readFile "Main.hs"
  putStrLn $ "MD5: " ++ (show.md5) byteStr
  putStrLn $ "SHA256: " ++ (show.sha256) byteStr
  putStrLn $ "SHA512: " ++ (show.sha512) byteStr
