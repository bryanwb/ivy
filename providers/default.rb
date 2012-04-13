#
# Cookbook Name:: ivy
# Provider::      default
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

action :install do
  full_name = [ new_resource.groupId, new_resource.artifactId, new_resource.version ].join(' ')
  # use a glob because file can have different extensions
  file_glob = "#{new_resource.artifactId}-#{new_resource.version}\.*"
  dest = new_resource.dest
  Chef::Log.debug("dest is #{dest}")
  dest_pattern = "#{dest}/[artifact]-[revision].[ext]"
  full_command = %Q{#{node['ivy']['command']} -dependency #{full_name} -retrieve #{dest_pattern} }
  Chef::Log.debug("dest is #{dest}")
  bash "get the dependency" do
    code <<-EOH
    #{full_command}
    chown #{new_resource.owner}:#{new_resource.owner} #{dest}
    chmod #{new_resource.mode.to_s} #{dest}
    EOH
    only_if { Dir.glob("#{dest}/#{file_glob}").empty? }
  end
end
