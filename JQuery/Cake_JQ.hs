
module Cake_JQ where

import Development.Cake3
import Development.Cake3.Ext.UrWeb
import Development.Cake3.Utils.Slice
import qualified Cake_URU as URU
import Cake_JQ_P

lib = uwlib (file "lib.urp") $ do
  library URU.lib
  embed (file "jquery-1.9.1.js")
  ur (file "JQuery.ur", file "JQuery.urs")

main = writeSliced (file "Makefile.dev") [(file "Makefile", [urembed,cake3,cakegen])] $ do
  selfUpdate
  rule $ do
    phony "all"
    depend lib