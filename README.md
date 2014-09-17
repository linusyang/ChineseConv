# Chinese Converter
Action Menu Plugin for converting texts into Traditional Chinese

Copyright (c) 2014 Linus Yang

## Introduction
*Chinese Converter* is a Cydia Substrate addon for [Action Menu](https://rpetri.ch/cydia/actionmenu/) which adds a pop-up button that converts any Chinese characters in selected text into Traditional Chinese.

*Chinese Converter* utilizes [OpenCC](BYVoid/OpenCC), a blazing fast Chinese conversion engine. OpenCC is already embedded in this project and the default configuration accords with Taiwan standard of Traditional Chinese.

Install it in Cydia by adding repo http://yangapp.googlecode.com/svn.

## Build
```bash
git clone --recursive https://github.com/linusyang/ChineseConv.git
cd ChineseConv
make package
```

## License
Licensed under [GPLv3](http://www.gnu.org/licenses/gpl.html).
