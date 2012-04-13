Description
===========

installs apache ivy and provides and lwrp for downloading jars and
their dependencies from ivy and maven repositories

Eventually should have an LWRP to define additional ivy and maven
repositories to pull jars from

Providers/Resources
===================

* artifactId: if this is not specified, the resource's name is used
* groupId: groupId for the artifact
* version: version of the artifact
* dest: the destination folder for the jar and its dependencies
* dest_attr: This is funky, use a node attribute optionally with subdirectory
* owner: the owner of the resulting file
* mode: file permissions


# Examples

    ivy "mysql-connector-java" do
      groupId "mysql"
      version "5.1.18"
      dest "/usr/local/tomcat/lib/"
    end

    ivy "mysql-connector-java" do
      groupId "mysql"
      version "5.1.18"
      dest_attr "tomcat_base/lib"
    end

    dest_attr resolves to "#{node[current_cookbook_name]['tomcat']['base']}/lib"

## License and Author

Author:: Bryan W. Berry (<bryan.berry@gmail.com>)
Copyright::             2012, Bryan W. Berry

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
