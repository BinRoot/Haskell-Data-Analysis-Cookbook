import NLP.POS
import Data.Text (pack)

-- Tagging the parts of speech
main = do
  tagger <- defaultTagger
  let text = pack "The best jokes have no punchline."
  print $ tag tagger text

