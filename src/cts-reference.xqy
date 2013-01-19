xquery version "1.0-ml";
(:
 : cts-reference.xqy
 :
 : Copyright (c) 2013 Michael Blakeley. All Rights Reserved.
 :
 : Licensed under the Apache License, Version 2.0 (the "License");
 : you may not use this file except in compliance with the License.
 : You may obtain a copy of the License at
 :
 : http://www.apache.org/licenses/LICENSE-2.0
 :
 : Unless required by applicable law or agreed to in writing, software
 : distributed under the License is distributed on an "AS IS" BASIS,
 : WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 : See the License for the specific language governing permissions and
 : limitations under the License.
 :
 : The use of the Apache License does not indicate that this project is
 : affiliated with the Apache Software Foundation.
 :
 :)
module namespace cr = "com.blakeley.cts-reference";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare function cr:options($n as element())
  as xs:string?
{
  typeswitch($n)
  case element(cts:collation) return 'collation='||$n
  case element(cts:coordinate-system) return 'coordinate-system='||$n
  case element(cts:field-name) return ()
  case element(cts:latitude-namespace-uri) return ()
  case element(cts:latitude-localname) return ()
  case element(cts:localname) return ()
  case element(cts:longitude-namespace-uri) return ()
  case element(cts:longitude-localname) return ()
  case element(cts:namespace-uri) return ()
  case element(cts:nullable) return $n/xs:boolean(.)
  case element(cts:parent-localname) return ()
  case element(cts:parent-namespace-uri) return ()
  case element(cts:path-expression) return ()
  case element(cts:scalar-type) return 'type='||$n
  default return error((), 'UNIMPLEMENTED', xdmp:describe($n))
};

declare function cr:reference($n as element())
  as cts:reference
{
  typeswitch($n)
  case element(cts:collection-reference) return cts:collection-reference()

  case element(cts:element-attribute-reference)
  return cts:element-attribute-reference(
    QName($n/cts:parent-namespace-uri, $n/cts:parent-localname),
    QName($n/cts:namespace-uri, $n/cts:localname),
    cr:options($n/*))

  case element(cts:element-reference) return cts:element-reference(
    QName($n/cts:namespace-uri, $n/cts:localname),
    cr:options($n/*))

  case element(cts:field-reference) return cts:field-reference(
    $n/cts:field-name,
    cr:options($n/*))

  (: Patches welcome! :)
  case element(cts:geospatial-attribute-pair-reference)
  return error((), 'UNIMPLEMENTED', xdmp:describe($n))

  case element(cts:geospatial-element-child-reference)
  return error((), 'UNIMPLEMENTED', xdmp:describe($n))

  case element(cts:geospatial-element-pair-reference)
  return error((), 'UNIMPLEMENTED', xdmp:describe($n))

  case element(cts:geospatial-element-reference)
  return error((), 'UNIMPLEMENTED', xdmp:describe($n))

  (: This is impossible to implement robustly in ML6,
   : because the namespaces are not in the XML.
   :)
  case element(cts:path-reference) return error(
    (), 'UNIMPLEMENTED', xdmp:describe($n))

  case element(cts:uri-reference) return cts:uri-reference()
  default return error((), 'UNIMPLEMENTED', xdmp:describe($n))
};

(: cts-reference.xqy :)
