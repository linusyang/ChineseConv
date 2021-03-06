/*
 * Open Chinese Convert
 *
 * Copyright 2010-2013 BYVoid <byvoid@byvoid.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#pragma once

#if defined(Opencc_BUILT_AS_STATIC) || !defined(_WIN32)
#  define OPENCC_EXPORT
#  define OPENCC_NO_EXPORT
#else
#  ifndef OPENCC_EXPORT
#    ifdef libopencc_EXPORTS
  /* We are building this library */
#      define OPENCC_EXPORT __declspec(dllexport)
#    else
  /* We are using this library */
#      define OPENCC_EXPORT __declspec(dllimport)
#    endif
#  endif

#  ifndef OPENCC_NO_EXPORT
#    define OPENCC_NO_EXPORT 
#  endif
#endif
