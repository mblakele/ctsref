CTS-REFERENCE - Deserialize cts:reference XML
===

Deserialize cts:reference XML
---

You have written an application or a service using MarkLogic Server
that relies on cts:reference items, for example
`cts:element-reference`. You would like to serialize these items as XML,
and perhaps store these items in a database document.
You can easily turn the cts:reference item into XML.
But as of MarkLogic 6, there is no easy way to turn the XML into an item.

This library can help.

Requirements
---

MarkLogic 6 or newer. Earlier versions do not support lexicon references.

Usage
---

    import module namespace cr="com.blakeley.cts-reference
      at "/path/to/cts-reference.xqy";

    cr:reference($xml-node)

Limitations
---

At this time cts-reference does not support the following reference types:

- cts:geospatial-attribute-pair-reference
- cts:geospatial-element-child-reference
- cts:geospatial-element-pair-reference
- cts:geospatial-element-reference
- cts:path-reference

These may be added in a future release, or when someone supplies a patch.

Problems and Patches
---

The cts-reference test cases use [XQUT](https://github.com/mblakele/xqut).
Note that these test cases change the database configuration
and may trigger refragmenting or reindexing.
For best results use an empty database.

If you find problems, please file an issue and provide a test case.
Patches are welcome, especially in the form of pull requests.

License
---
Copyright (c) 2013 Michael Blakeley. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

The use of the Apache License does not indicate that this project is
affiliated with the Apache Software Foundation.
