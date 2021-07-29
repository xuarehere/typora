#!/bin/sh
#sed -n '/\^this/p' example2_caret_character.txt      # 这样之后，什么也没有
sed -n '/^this/p' example2_caret_character.txt        # 正确的方式