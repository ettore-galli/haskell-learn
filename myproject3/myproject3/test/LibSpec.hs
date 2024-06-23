module LibSpec (spec) where

import Lib
import Test.Hspec

spec :: Spec
spec = do
  describe "wrapString Wraps" $ do
    it "Wrap 1" $
      shouldBe
        (wrapString "<" ">" "hello")
        "<hello!>"