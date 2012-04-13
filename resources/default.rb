#
# Cookbook Name:: ivy
# Resource::      default
#
# Author:: Bryan W. Berry <bryan.berry@gmail.com>
# Copyright 2012, Bryan W. Berry
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

actions :install

attribute :artifactId, :kind_of => String
attribute :groupId, :kind_of => String, :required => true
attribute :version, :kind_of => String, :required => true
attribute :dest, :kind_of => String
attribute :dest_attr, :kind_of => String
attribute :owner, :kind_of => String, :default => "root"
attribute :mode, :kind_of => [String, Integer], :default => "0755"

def initialize(*args)
  super
  # we can't use the node properties when initially specifying the resource
  @artifactId ||= @name
  @action = :install
end
