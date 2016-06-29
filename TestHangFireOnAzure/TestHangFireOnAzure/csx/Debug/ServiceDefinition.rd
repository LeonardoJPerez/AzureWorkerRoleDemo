<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="TestHangFireOnAzure" generation="1" functional="0" release="0" Id="d020c89e-425e-44eb-b3bb-1d3fbe733363" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="TestHangFireOnAzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="HangfireDashboardRole:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/LB:HangfireDashboardRole:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="HangfireDashboardRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/MapHangfireDashboardRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="HangfireDashboardRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/MapHangfireDashboardRoleInstances" />
          </maps>
        </aCS>
        <aCS name="HangfireServerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/MapHangfireServerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="HangfireServerRoleInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/MapHangfireServerRoleInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:HangfireDashboardRole:Endpoint1">
          <toPorts>
            <inPortMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRole/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapHangfireDashboardRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapHangfireDashboardRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRoleInstances" />
          </setting>
        </map>
        <map name="MapHangfireServerRole:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireServerRole/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapHangfireServerRoleInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireServerRoleInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="HangfireDashboardRole" generation="1" functional="0" release="0" software="C:\Source\TestHangFireOnAzure\TestHangFireOnAzure\csx\Debug\roles\HangfireDashboardRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;HangfireDashboardRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;HangfireDashboardRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;HangfireServerRole&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="HangfireServerRole" generation="1" functional="0" release="0" software="C:\Source\TestHangFireOnAzure\TestHangFireOnAzure\csx\Debug\roles\HangfireServerRole" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;HangfireServerRole&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;HangfireDashboardRole&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;HangfireServerRole&quot; /&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireServerRoleInstances" />
            <sCSPolicyUpdateDomainMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireServerRoleUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireServerRoleFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="HangfireServerRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="HangfireDashboardRoleUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="HangfireDashboardRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="HangfireServerRoleFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="HangfireDashboardRoleInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="HangfireServerRoleInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="d44307e4-b9d0-44f4-8af5-cf79a1a399a9" ref="Microsoft.RedDog.Contract\ServiceContract\TestHangFireOnAzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="50beca4c-a5da-4c89-b383-08b135fe890d" ref="Microsoft.RedDog.Contract\Interface\HangfireDashboardRole:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/TestHangFireOnAzure/TestHangFireOnAzureGroup/HangfireDashboardRole:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>