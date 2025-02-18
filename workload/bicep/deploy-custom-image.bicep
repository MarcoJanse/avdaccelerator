targetScope = 'subscription'

// ========== //
// Parameters //
// ========== //

// Placeholder for future release
// @maxLength(60)
// @description('Optional. Custom name for container storing AIB artifacts. (Default: avd-artifacts)')
// param aibContainerCustomName string = 'aib-artifacts'

@description('Optional. Custom name for Action Group.')
param alertsActionGroupCustomName string = 'ag-aib'

@description('Optional. Input the email distribution list for alert notifications when AIB builds succeed or fail.')
param alertsDistributionGroup string = ''

@description('Optional. Details about the application.')
param applicationNameTag string = 'Contoso-App'

@description('Optional. Custom name for the Automation Account.')
param automationAccountCustomName string = 'aa-avd'

// Placeholder for future release
// @maxLength(60)
// @description('Optional. Custom name for container storing AVD artifacts. (Default: avd-artifacts)')
// param avdContainerCustomName string = 'avd-artifacts'

@allowed([
    'OneTime'
    'Recurring'
])
@description('Optional. Determine whether to build the image template one time or check daily for a new marketplace image and auto build when found. (Default: Recurring)')
param buildSchedule string = 'Recurring'

@description('Optional. Cost center of owner team. (Defualt: Contoso-CC)')
param costCenterTag string = 'Contoso-CC'

@description('Optional. Tag value for custom criticality value. (Default: Contoso-Critical)')
param criticalityCustomTag string = 'Contoso-Critical'

@allowed([
    'Low'
    'Medium'
    'High'
    'Mission-critical'
    'Custom'
])
@description('Optional. criticality of each workload. (Default: Low)')
param criticalityTag string = 'Low'

@description('Optional. Determine whether to enable custom naming for the Azure resources. (Default: false)')
param customNaming bool = false

@allowed([
    'Non-business'
    'Public'
    'General'
    'Confidential'
    'Highly Confidential'
])
@description('Optional. Sensitivity of data hosted (Default: Non-business)')
param dataClassificationTag string = 'Non-business'

@description('Optional. Department that owns the deployment, (Dafult: Contoso-AVD)')
param departmentTag string = 'Contoso-AVD'

@allowed([
    'australiaeast'
    'australiasoutheast'
    'brazilsouth'
    'canadacentral'
    'centralindia'
    'centralus'
    'eastasia'
    'eastus'
    'eastus2'
    'francecentral'
    'germanywestcentral'
    'japaneast'
    'jioindiawest'
    'koreacentral'
    'northcentralus'
    'northeurope'
    'norwayeast'
    'qatarcentral'
    'southafricanorth'
    'southcentralus'
    'southeastasia'
    'switzerlandnorth'
    'uaenorth'
    'uksouth'
    'ukwest'
    'usgovarizona'
    'usgoviowa'
    'usgovtexas'
    'usgovvirginia'
    'westcentralus'
    'westeurope'
    'westus'
    'westus2'
    'westus3'
])
@description('Required. Location to deploy the resources in this solution, except the image template. (Default: eastus)')
param deploymentLocation string = 'eastus'

@description('Optional. Set to deploy monitoring and alerts for the build automation (Default: false).')
param enableMonitoringAlerts bool = false

@description('Optional. Apply tags on resources and resource groups. (Default: false)')
param enableResourceTags bool = false

@description('Enable usage and telemetry feedback to Microsoft.')
param enableTelemetry bool = true

@allowed([
    'Prod'
    'Dev'
    'Staging'
])
@description('Optional. Deployment environment of the application, workload. (Default: Dev)')
param environmentTag string = 'Dev'

@description('Optional. Existing Azure log analytics workspace resource ID to capture build logs. (Default: )')
param existingLogAnalyticsWorkspaceResourceId string = ''

@description('Optional. Input the name of the subnet for the existing virtual network that the network interfaces on the build virtual machines will join. (Default: "")')
param existingSubnetName string = ''

@description('Optional. Input the resource ID for the existing virtual network that the network interfaces on the build virtual machines will join. (Default: "")')
param existingVirtualNetworkResourceId string = ''

@description('Optional. The name of workload for tagging purposes. (Default: AVD-Image)')
param imageBuildNameTag string = 'AVD-Image'

@maxLength(64)
@description('Optional. Custom name for Image Definition. (Default: avd-win11-21h2)')
param imageDefinitionCustomName string = 'avd-win11-21h2'

@description('''Optional. The image supports accelerated networking.
Accelerated networking enables single root I/O virtualization (SR-IOV) to a VM, greatly improving its networking performance.
This high-performance path bypasses the host from the data path, which reduces latency, jitter, and CPU utilization for the
most demanding network workloads on supported VM types.
''')
@allowed([
    'true'
    'false'
])
param imageDefinitionAcceleratedNetworkSupported string = 'false'

@description('Optional. The image will support hibernation.')
@allowed([
    'true'
    'false'
])
param imageDefinitionHibernateSupported string = 'false'

@allowed([
    'Standard'
    'TrustedLaunch'
    'ConfidentialVM'
    'ConfidentialVMSupported'
])
@description('Optional. Choose the Security Type of the Image Definition. (Default: Standard)')
param imageDefinitionSecurityType string = 'Standard'

@maxLength(64)
@description('Optional. Custom name for Image Gallery. (Default: gal_avd_use2_001)')
param imageGalleryCustomName string = 'gal_avd_use2_001'

@maxLength(260)
@description('Optional. Custom name for Image Template. (Default: it-avd-win11-21h2)')
param imageTemplateCustomName string = 'it-avd-win11-22h2'

@description('Optional. Disaster recovery replication location for Image Version. (Default:"")')
param imageVersionDisasterRecoveryLocation string = ''

@description('Required. Primary replication location for Image Version. (Default:)')
param imageVersionPrimaryLocation string

@allowed([
    //'Premium_LRS' supported by Image Versions but not Image Templates yet
    'Standard_LRS'
    'Standard_ZRS'
])
@description('Optional. Determine the Storage Account Type for the Image Version distributed by the Image Template. (Default: Standard_LRS)')
param imageVersionStorageAccountType string = 'Standard_LRS'

@description('Optional. Custom name for the Log Analytics Workspace.')
param logAnalyticsWorkspaceCustomName string = 'log-avd'

@maxValue(720)
@minValue(30)
@description('Optional. Set the data retention in the number of days for the Log Analytics Workspace. (Default: 30)')
param logAnalyticsWorkspaceDataRetention int = 30

@allowed([
    'win10_21h2'
    'win10_21h2_office'
    'win10_22h2_g2'
    'win10_22h2_office_g2'
    'win11_21h2'
    'win11_21h2_office'
    'win11_22h2'
    'win11_22h2_office'
])
@description('Optional. AVD OS image source. (Default: win11-22h2)')
param operatingSystemImage string = 'win11_22h2'

@description('Optional. Team accountable for day-to-day operations. (Contoso-Ops)')
param operationsTeamTag string = 'workload-admins@Contoso.com'

@description('Optional. Organizational owner of the AVD deployment. (Default: Contoso-Owner)')
param ownerTag string = 'workload-owner@Contoso.com'

@description('Optional. Determine whether to enable RDP Short Path for Managed Networks. (Default: false)')
param rdpShortPathManagedNetworks bool = false

@maxLength(90)
@description('Optional. Custom name for Resource Group. (Default: rg-avd-use2-shared-services)')
param resourceGroupCustomName string = 'rg-avd-use2-shared-services'

@description('Optional. Determine whether to enable Screen Capture Protection. (Default: false)')
param screenCaptureProtection bool = false

@description('Required. AVD shared services subscription ID, multiple subscriptions scenario.')
param sharedServicesSubId string

// Placeholder for future release
// @maxLength(24)
// @description('Optional. Custom name for Storage Account. (Default: stavdshar)')
// param storageAccountCustomName string = ''

// Placeholder for future release
// @allowed([
//     'Standard_LRS'
//     'Standard_ZRS'
// ])
// @description('Optional. Determine the Storage Account SKU for local or zonal redundancy. (Default: Standard_LRS)')
// param storageAccountSku string = 'Standard_LRS'

@description('Do not modify, used to set unique value for resource deployment.')
param time string = utcNow()

@description('Optional. Set to deploy Azure Image Builder to existing virtual network. (Default: false)')
param useExistingVirtualNetwork bool = false

@maxLength(128)
@description('Optional. Custom name for User Assigned Identity. (Default: id-avd)')
param userAssignedManagedIdentityCustomName string = ''

@description('Optional. Reference to the size of the VM for your workloads (Default: Contoso-Workload)')
param workloadNameTag string = 'Contoso-Workload'

// =========== //
// Variables   //
// =========== //

var varActionGroupName = customNaming ? alertsActionGroupCustomName : 'ag-avd-${varNamingStandard}'
// Placeholder for future feature
// var varAibContainerName = customNaming ? aibContainerCustomName : 'aib-artifacts'
var varAlerts = enableMonitoringAlerts ? [
    {
        name: 'Azure Image Builder - Build Failure'
        description: 'Sends an error alert when a build fails on an image template for Azure Image Builder.'
        severity: 0
        evaluationFrequency: 'PT5M'
        windowSize: 'PT5M'
        criterias: {
            allOf: [
                {
                    query: 'AzureDiagnostics\n| where ResourceProvider == "MICROSOFT.AUTOMATION"\n| where Category  == "JobStreams"\n| where ResultDescription has "Image Template build failed"'
                    timeAggregation: 'Count'
                    dimensions: [
                        {
                            name: 'ResultDescription'
                            operator: 'Include'
                            values: [
                                '*'
                            ]
                        }
                    ]
                    operator: 'GreaterThanOrEqual'
                    threshold: 1
                    failingPeriods: {
                        numberOfEvaluationPeriods: 1
                        minFailingPeriodsToAlert: 1
                    }
                }
            ]
        }
    }
    {
        name: 'Azure Image Builder - Build Success'
        description: 'Sends an informational alert when a build succeeds on an image template for Azure Image Builder.'
        severity: 3
        evaluationFrequency: 'PT5M'
        windowSize: 'PT5M'
        criterias: {
            allOf: [
                {
                    query: 'AzureDiagnostics\n| where ResourceProvider == "MICROSOFT.AUTOMATION"\n| where Category  == "JobStreams"\n| where ResultDescription has "Image Template build succeeded"'
                    timeAggregation: 'Count'
                    dimensions: [
                        {
                            name: 'ResultDescription'
                            operator: 'Include'
                            values: [
                                '*'
                            ]
                        }
                    ]
                    operator: 'GreaterThanOrEqual'
                    threshold: 1
                    failingPeriods: {
                        numberOfEvaluationPeriods: 1
                        minFailingPeriodsToAlert: 1
                    }
                }
            ]
        }
    }
] : []
var varAutomationAccountName = customNaming ? automationAccountCustomName : 'aa-avd-${varNamingStandard}'
// Placeholder for future feature
// var varAvdContainerName = customNaming ? avdContainerCustomName : 'avd-artifacts'
var varAzureCloudName = environment().name
var varBaseScriptUri = 'https://raw.githubusercontent.com/Azure/avdaccelerator/main/workload/'
var varCommonResourceTags = enableResourceTags ? {
    ImageBuildName: imageBuildNameTag
    WorkloadName: workloadNameTag
    DataClassification: dataClassificationTag
    Department: departmentTag
    Criticality: (criticalityTag == 'Custom') ? criticalityCustomTag : criticalityTag
    ApplicationName: applicationNameTag
    OpsTeam: operationsTeamTag
    Owner: ownerTag
    CostCenter: costCenterTag
    Environment: environmentTag

} : {}
var varCustomizationSteps = union(varScriptCustomizers, varRemainingCustomizers)
var varImageDefinitionName = customNaming ? imageDefinitionCustomName : 'avd-${operatingSystemImage}'
var varImageGalleryName = customNaming ? imageGalleryCustomName : 'gal_avd_${varNamingStandard}'
var varImageReplicationRegions = empty(imageVersionDisasterRecoveryLocation) ? [
    imageVersionPrimaryLocation
] : [
    imageVersionPrimaryLocation
    imageVersionDisasterRecoveryLocation
]
// Image template permissions are currently (1/6/23) not supported in Azure US Government
var varImageTemplateBuildAutomationName = 'Image Template Build Automation'
var varImageTemplateBuildAutomation = varAzureCloudName == 'AzureCloud' ? [
    {
        resourceGroup: varResourceGroupName
        name: varImageTemplateBuildAutomationName
        description: 'Allow Image Template build automation using a Managed Identity on an Automation Account.'
        actions: [
            'Microsoft.VirtualMachineImages/imageTemplates/run/action'
            'Microsoft.VirtualMachineImages/imageTemplates/read'
            'Microsoft.Compute/locations/publishers/artifacttypes/offers/skus/versions/read'
            'Microsoft.Compute/locations/publishers/artifacttypes/offers/skus/read'
            'Microsoft.Compute/locations/publishers/artifacttypes/offers/read'
            'Microsoft.Compute/locations/publishers/read'
        ]
    }
] : []
var varImageTemplateContributorRoleName = 'Image Template Contributor'
var varImageTemplateContributorRole = [
    {
        resourceGroup: varResourceGroupName
        name: varImageTemplateContributorRoleName
        description: 'Allow the creation and management of images'
        actions: [
            'Microsoft.Compute/galleries/read'
            'Microsoft.Compute/galleries/images/read'
            'Microsoft.Compute/galleries/images/versions/read'
            'Microsoft.Compute/galleries/images/versions/write'
            'Microsoft.Compute/images/read'
            'Microsoft.Compute/images/write'
            'Microsoft.Compute/images/delete'
        ]
    }
]
var varImageTemplateName = customNaming ? imageTemplateCustomName : 'it-avd-${operatingSystemImage}'
var varLocationAcronym = varLocations[varLocation].acronym
var varLocation = toLower(replace(deploymentLocation, ' ', ''))
var varLocations = loadJsonContent('../variables/locations.json')
var varLogAnalyticsWorkspaceName = customNaming ? logAnalyticsWorkspaceCustomName : 'log-avd-${varNamingStandard}'
var varModules = [
    {
        name: 'Az.Accounts'
        uri: 'https://www.powershellgallery.com/api/v2/package'
        version: '2.12.1'
    }
    {
        name: 'Az.ImageBuilder'
        uri: 'https://www.powershellgallery.com/api/v2/package'
        version: '0.3.0'
    }
]
var varNamingStandard = '${varLocationAcronym}'
var varOperatingSystemImageDefinitions = {
    win10_21h2: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'windows-10'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win10-21h2-avd'
        hyperVGeneration: 'V1'
        version: 'latest'
    }
    win10_21h2_office: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'office-365'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win10-21h2-avd-m365'
        hyperVGeneration: 'V1'
        version: 'latest'
    }
    win10_22h2_g2: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'windows-10'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win10-22h2-avd-g2'
        hyperVGeneration: 'V2'
        version: 'latest'
    }
    win10_22h2_office_g2: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'office-365'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win10-22h2-avd-m365-g2'
        hyperVGeneration: 'V2'
        version: 'latest'
    }
    win11_21h2: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'windows-11'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win11-21h2-avd'
        hyperVGeneration: 'V2'
        version: 'latest'
    }
    win11_21h2_office: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'office-365'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win11-21h2-avd-m365'
        hyperVGeneration: 'V2'
        version: 'latest'
    }
    win11_22h2: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'windows-11'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win11-22h2-avd'
        hyperVGeneration: 'V2'
        version: 'latest'
    }
    win11_22h2_office: {
        osType: 'Windows'
        osState: 'Generalized'
        offer: 'office-365'
        publisher: 'MicrosoftWindowsDesktop'
        sku: 'win11-22h2-avd-m365'
        hyperVGeneration: 'V2'
        version: 'latest'
    }
}
var varRdpShortPathCustomizer = rdpShortPathManagedNetworks ? [
    {
        type: 'PowerShell'
        name: 'rdpShortPath'
        runElevated: true
        runAsSystem: true
        scriptUri: '${varBaseScriptUri}scripts/Set-RdpShortpath.ps1'
    }
] : []
var varRemainingCustomizers = [
    {
        type: 'WindowsRestart'
        restartCheckCommand: 'Write-Host "Restarting post script customizers"'
        restarttimeout: '10m'
    }
    {
        type: 'WindowsUpdate'
        searchCriteria: 'IsInstalled=0'
        filters: [
            'exclude:$_.Title -like \'*Preview*\''
            'include:$true'
        ]
        updateLimit: 40
    }
    {
        type: 'PowerShell'
        name: 'Sleep for a min'
        runElevated: true
        runAsSystem: true
        inline: [
            'Write-Host "Sleep for a 5 min"'
            'Start-Sleep -Seconds 300'
        ]
    }
    {
        type: 'WindowsRestart'
        restartCheckCommand: 'Write-Host "restarting post Windows updates"'
        restarttimeout: '10m'
    }
    {
        type: 'PowerShell'
        name: 'Sleep for a min'
        runElevated: true
        runAsSystem: true
        inline: [
            'Write-Host "Sleep for a min"'
            'Start-Sleep -Seconds 60'
        ]
    }
    {
        type: 'WindowsRestart'
        restarttimeout: '10m'
    }
]
var varResourceGroupName = customNaming ? resourceGroupCustomName : 'rg-avd-${varNamingStandard}-shared-services'
//var varRoles = union(varVirtualNetworkJoinRoleExistingRoleCheck, varRolesimageTemplateBuildAutomationExistingRoleCheck, varImageTemplateContributorRoleExistingRoleCheck)
var varRoles = union(varVirtualNetworkJoinRole, varImageTemplateBuildAutomation, varImageTemplateContributorRole)
//var varRolesimageTemplateBuildAutomationExistingRoleCheck = empty(imageTemplateBuildAutomationExistingRoleCheck.id) ? varImageTemplateBuildAutomation : []
//var varImageTemplateContributorRoleExistingRoleCheck = empty(imageTemplateContributorExistingRoleCheck.id) ? varImageTemplateContributorRole : []
//var varVirtualNetworkJoinRoleExistingRoleCheck = empty(virtualNetworkJoinExistingRoleCheck.id) ? varVirtualNetworkJoinRole : []
var varScreenCaptureProtectionCustomizer = screenCaptureProtection ? [
    {
        type: 'PowerShell'
        name: 'screenCaptureProtection'
        runElevated: true
        runAsSystem: true
        scriptUri: '${varBaseScriptUri}scripts/Set-ScreenCaptureProtection.ps1'
    }
] : []
var varScriptCustomizers = union(varRdpShortPathCustomizer, varScreenCaptureProtectionCustomizer, varVdotCustomizer)
// Placeholder for future feature
// var varStorageAccountName = customNaming ? storageAccountCustomName : 'stavd${varNamingStandard}${varUniqueStringSixChar}'
var varTelemetryId = 'pid-b04f18f1-9100-4b92-8e41-71f0d73e3755-${deploymentLocation}'
var varTimeZone = varLocations[varLocation].timeZone

// Placeholder for future feature
// var varUniqueStringSixChar = take('${uniqueString(sharedServicesSubId, time)}', 6)
var varUserAssignedManagedIdentityName = customNaming ? userAssignedManagedIdentityCustomName : 'id-aib-${varNamingStandard}'
var varVdotCustomizer = [
    {
        type: 'PowerShell'
        name: 'VirtualDesktopOptimizationTool'
        runElevated: true
        runAsSystem: true
        scriptUri: '${varBaseScriptUri}scripts/Set-VirtualDesktopOptimizations.ps1'
    }
]
var varVirtualNetworkJoinRoleName = 'Virtual Network Join'
var varVirtualNetworkJoinRole = useExistingVirtualNetwork ? [
    {
        resourceGroup: split(existingVirtualNetworkResourceId, '/')[4]
        name: varVirtualNetworkJoinRoleName
        description: 'Allow resources to join a subnet'
        actions: [
            'Microsoft.Network/virtualNetworks/read'
            'Microsoft.Network/virtualNetworks/subnets/read'
            'Microsoft.Network/virtualNetworks/subnets/join/action'
        ]
    }
] : []
var varVmSize = 'Standard_D4s_v3'

// =========== //
// Deployments //
// =========== //

// Telemetry Deployment.
resource telemetryDeployment 'Microsoft.Resources/deployments@2021-04-01' = if (enableTelemetry) {
    name: varTelemetryId
    location: deploymentLocation
    properties: {
        mode: 'Incremental'
        template: {
            '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
            contentVersion: '1.0.0.0'
            resources: []
        }
    }
}

// AVD Shared Services Resource Group.
module avdSharedResourcesRg '../../carml/1.3.0/Microsoft.Resources/resourceGroups/deploy.bicep' = {
    scope: subscription(sharedServicesSubId)
    name: 'Resource-Group-${time}'
    params: {
        name: varResourceGroupName
        location: deploymentLocation
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
}
/*
// Role definition check Image Template Build Automation.
resource imageTemplateBuildAutomationExistingRoleCheck 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
    name: varImageTemplateBuildAutomationName
}

// Role definition check Image Template Contributor.
resource imageTemplateContributorExistingRoleCheck 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
    name: varImageTemplateContributorRoleName
}

// Role definition check Image Template Build Automation.
resource virtualNetworkJoinExistingRoleCheck 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
    name: varVirtualNetworkJoinRoleName
}
*/

// Role definition deployment.
module roleDefinitions '../../carml/1.3.0/Microsoft.Authorization/roleDefinitions/subscription/deploy.bicep' = [for i in range(0, length(varRoles)): {
    scope: subscription(sharedServicesSubId)
    name: 'Role-Definition-${i}-${time}'
    params: {
        location: deploymentLocation
        subscriptionId: sharedServicesSubId
        description: varRoles[i].description
        roleName: varRoles[i].name
        actions: varRoles[i].actions
        assignableScopes: [
            '/subscriptions/${sharedServicesSubId}'
        ]
    }
    //dependsOn: [
    //    imageTemplateBuildAutomationExistingRoleCheck
    //    virtualNetworkJoinExistingRoleCheck
    //    imageTemplateContributorExistingRoleCheck
    //]
}]

// Managed identity.
module userAssignedManagedIdentity '../../carml/1.3.0/Microsoft.ManagedIdentity/userAssignedIdentities/deploy.bicep' = {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'User-Assigned-Managed-Identity-${time}'
    params: {
        name: varUserAssignedManagedIdentityName
        location: deploymentLocation
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        avdSharedResourcesRg
    ]
}

// Role assignments.
module roleAssignments '../../carml/1.3.0/Microsoft.Authorization/roleAssignments/resourceGroup/deploy.bicep' = [for i in range(0, length(varRoles)): {
    name: 'Role-Assignment-${i}-${time}'
    scope: resourceGroup(sharedServicesSubId, varRoles[i].resourceGroup)
    params: {
        roleDefinitionIdOrName: roleDefinitions[i].outputs.resourceId
        principalId: userAssignedManagedIdentity.outputs.principalId
        principalType: 'ServicePrincipal'
    }
}]

//// Unique role assignment for Azure US Government since it does not support image template permissions
module roleAssignment_AzureUSGovernment '../../carml/1.3.0/Microsoft.Authorization/roleAssignments/resourceGroup/deploy.bicep' = if (varAzureCloudName != 'AzureCloud') {
    name: 'Role-Assignment-MAG-${time}'
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    params: {
        roleDefinitionIdOrName: 'Contributor'
        principalId: userAssignedManagedIdentity.outputs.principalId
        principalType: 'ServicePrincipal'
    }
}

// Compute Gallery.
module gallery '../../carml/1.3.0/Microsoft.Compute/galleries/deploy.bicep' = {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Compute-Gallery-${time}'
    params: {
        name: varImageGalleryName
        location: imageVersionPrimaryLocation
        galleryDescription: 'Azure Virtual Desktops Images'
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        avdSharedResourcesRg
    ]
}

// Image Definition.
module image '../../carml/1.3.0/Microsoft.Compute/galleries/images/deploy.bicep' = {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Image-Definition-${time}'
    params: {
        galleryName: varImageGalleryName
        name: varImageDefinitionName
        osState: varOperatingSystemImageDefinitions[operatingSystemImage].osState
        osType: varOperatingSystemImageDefinitions[operatingSystemImage].osType
        publisher: varOperatingSystemImageDefinitions[operatingSystemImage].publisher
        offer: varOperatingSystemImageDefinitions[operatingSystemImage].offer
        sku: varOperatingSystemImageDefinitions[operatingSystemImage].sku
        location: imageVersionPrimaryLocation
        hyperVGeneration: varOperatingSystemImageDefinitions[operatingSystemImage].hyperVGeneration
        isAcceleratedNetworkSupported: imageDefinitionAcceleratedNetworkSupported
        isHibernateSupported: imageDefinitionHibernateSupported
        securityType: imageDefinitionSecurityType
        //productName: operatingSystemImage
        //planName: varOperatingSystemImageDefinitions[operatingSystemImage].offer
        //planPublisherName: varOperatingSystemImageDefinitions[operatingSystemImage].publisher
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        gallery
        avdSharedResourcesRg
    ]
}

// Image template.
module imageTemplate '../../carml/1.3.0/Microsoft.VirtualMachineImages/imageTemplates/deploy.bicep' = {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Image-Template-${time}'
    params: {
        name: varImageTemplateName
        subnetId: !empty(existingVirtualNetworkResourceId) && !empty(existingSubnetName) ? '${existingVirtualNetworkResourceId}/subnets/${existingSubnetName}' : ''
        userMsiName: userAssignedManagedIdentity.outputs.name
        userMsiResourceGroup: userAssignedManagedIdentity.outputs.resourceGroupName
        location: deploymentLocation
        imageReplicationRegions: varImageReplicationRegions
        storageAccountType: imageVersionStorageAccountType
        sigImageDefinitionId: image.outputs.resourceId
        vmSize: varVmSize
        customizationSteps: varCustomizationSteps
        imageSource: {
            type: 'PlatformImage'
            publisher: varOperatingSystemImageDefinitions[operatingSystemImage].publisher
            offer: varOperatingSystemImageDefinitions[operatingSystemImage].offer
            sku: varOperatingSystemImageDefinitions[operatingSystemImage].sku
            version: varOperatingSystemImageDefinitions[operatingSystemImage].version
        }
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        image
        gallery
        avdSharedResourcesRg
        roleAssignments
    ]
}

// Log Analytics Workspace.
module workspace '../../carml/1.3.0/Microsoft.OperationalInsights/workspaces/deploy.bicep' = if (enableMonitoringAlerts && empty(existingLogAnalyticsWorkspaceResourceId)) {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Log-Analytics-Workspace-${time}'
    params: {
        location: deploymentLocation
        name: varLogAnalyticsWorkspaceName
        dataRetention: logAnalyticsWorkspaceDataRetention
        useResourcePermissions: true
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        avdSharedResourcesRg
    ]
}

// Introduce wait after log analitics workspace creation.
module workspaceWait '../../carml/1.3.0/Microsoft.Resources/deploymentScripts/deploy.bicep' = if (enableMonitoringAlerts && empty(existingLogAnalyticsWorkspaceResourceId)) {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Log-Analytics-Workspace-Wait-${time}'
    params: {
        name: 'Log-Analytics-Workspace-Wait-${time}'
        location: deploymentLocation
        azPowerShellVersion: '8.3.0'
        cleanupPreference: 'Always'
        timeout: 'PT10M'
        scriptContent: '''
        Write-Host "Start"
        Get-Date
        Start-Sleep -Seconds 60
        Write-Host "Stop"
        Get-Date
        '''
    }
    dependsOn: [
        workspace
    ]
}

// Automation account.
module automationAccount '../../carml/1.3.0/Microsoft.Automation/automationAccounts/deploy.bicep' = {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Automation-Account-${time}'
    params: {
        diagnosticLogCategoriesToEnable: [
            'JobLogs'
            'JobStreams'
        ]
        diagnosticLogsRetentionInDays: 30
        diagnosticWorkspaceId: empty(alertsDistributionGroup) ? '' : empty(existingLogAnalyticsWorkspaceResourceId) ? workspace.outputs.resourceId : existingLogAnalyticsWorkspaceResourceId
        name: varAutomationAccountName
        jobSchedules: [
            {
                parameters: {
                    ClientId: userAssignedManagedIdentity.outputs.clientId
                    EnvironmentName: varAzureCloudName
                    ImageOffer: varOperatingSystemImageDefinitions[operatingSystemImage].offer
                    ImagePublisher: varOperatingSystemImageDefinitions[operatingSystemImage].publisher
                    ImageSku: varOperatingSystemImageDefinitions[operatingSystemImage].sku
                    Location: deploymentLocation
                    SubscriptionId: sharedServicesSubId
                    TemplateName: imageTemplate.outputs.name
                    TemplateResourceGroupName: varResourceGroupName
                    TenantId: subscription().tenantId
                }
                runbookName: 'aib-build-automation'
                scheduleName: varImageTemplateName
            }
        ]
        location: deploymentLocation
        runbooks: [
            {
                name: 'aib-build-automation'
                description: 'When this runbook is triggered, last build date is checked on the AIB image template.  If a new marketplace image has been released since that date, a new build is initiated. If a build has never been initiated then it will be start one.'
                type: 'PowerShell'
                // ToDo: Update URL before PR merge
                uri: 'https://raw.githubusercontent.com/Azure/avdaccelerator/main/workload/scripts/New-AzureImageBuilderBuild.ps1'
                version: '1.0.0.0'
            }
        ]
        schedules: [
            {
                name: varImageTemplateName
                frequency: buildSchedule == 'OneTime' ? 'OneTime' : 'Day'
                interval: buildSchedule == 'OneTime' ? 0 : 1
                starttime: dateTimeAdd(time, 'PT15M')
                varTimeZone: varTimeZone
                advancedSchedule: {} // required to prevent deployment failure
            }
        ]
        skuName: 'Free'
        tags: enableResourceTags ? varCommonResourceTags : {}
        systemAssignedIdentity: false
        userAssignedIdentities: {
            '${userAssignedManagedIdentity.outputs.resourceId}': {}
        }
    }
    dependsOn: empty(existingLogAnalyticsWorkspaceResourceId) ? [
        workspaceWait
    ] : []
}

// Automation accounts.
@batchSize(1)
module modules '../../carml/1.3.0/Microsoft.Automation/automationAccounts/modules/deploy.bicep' = [for i in range(0, length(varModules)): {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Automation-Account-Module-${i}-${time}'
    params: {
        name: varModules[i].name
        location: deploymentLocation
        automationAccountName: automationAccount.outputs.name
        uri: varModules[i].uri
        version: varModules[i].version
    }
}]

// Commenting out for future feature release
/* module storageAccount '../../carml/1.2.0/Microsoft.Storage/storageAccounts/deploy.bicep' = {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Storage-Account-${time}'
    params: {
        name: varStorageAccountName
        location: deploymentLocation
        storageAccountSku: storageAccountSku
        storageAccountKind: 'StorageV2'
        blobServices: {
            containers: [
                {
                    name: varAibContainerName
                    publicAccess: 'None'
                }
                {
                    name: varAvdContainerName
                    publicAccess: 'None'
                }
            ]
        }
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        avdSharedResourcesRg
    ]
} 
*/

// Action groups.
module actionGroup '../../carml/1.3.0/Microsoft.Insights/actionGroups/deploy.bicep' = if (enableMonitoringAlerts) {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Action-Group-${time}'
    params: {
        location: 'global'
        groupShortName: 'aib-email'
        name: varActionGroupName
        enabled: true
        emailReceivers: [
            {
                name: alertsDistributionGroup
                emailAddress: alertsDistributionGroup
                useCommonvarAlertschema: true
            }
        ]
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: [
        avdSharedResourcesRg
    ]
}

// Schedules.
module scheduledQueryRules '../../carml/1.3.0/Microsoft.Insights/scheduledQueryRules/deploy.bicep' = [for i in range(0, length(varAlerts)): if (enableMonitoringAlerts) {
    scope: resourceGroup(sharedServicesSubId, varResourceGroupName)
    name: 'Scheduled-Query-Rule-${i}-${time}'
    params: {
        location: deploymentLocation
        name: varAlerts[i].name
        alertDescription: varAlerts[i].description
        enabled: true
        kind: 'LogAlert'
        autoMitigate: false
        skipQueryValidation: false
        targetResourceTypes: []
        roleAssignments: []
        scopes: empty(alertsDistributionGroup) ? [] : empty(existingLogAnalyticsWorkspaceResourceId) ? [
            workspace.outputs.resourceId
        ] : [
            existingLogAnalyticsWorkspaceResourceId
        ]
        severity: varAlerts[i].severity
        evaluationFrequency: varAlerts[i].evaluationFrequency
        windowSize: varAlerts[i].windowSize
        actions: !empty(alertsDistributionGroup) ? [
            actionGroup.outputs.resourceId
        ] : []
        criterias: varAlerts[i].criterias
        tags: enableResourceTags ? varCommonResourceTags : {}
    }
    dependsOn: empty(existingLogAnalyticsWorkspaceResourceId) ? [
        workspaceWait
    ] : []
}]
