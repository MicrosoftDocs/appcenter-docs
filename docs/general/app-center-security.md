---
title: Visual Studio App Center Security and Compliance
description: Describes the security standards and compliance mechanisms followed by Visual Studio App Center
keywords: security Azure "App Center"
author: lucen-ms
ms.author: kegr
ms.date: 08/17/2020
ms.topic: article
ms.assetid: bfd4315d-4514-4d33-9ebe-4fb8af940fa2
ms.service: vs-appcenter
ms.custom: general
---

# Visual Studio App Center Security and Compliance

App Center takes security seriously. As a first-party Microsoft Azure service, we're responsible for following all of Microsoft's internal requirements for operating in a secure and reliable way.

We want to give you an idea of some of the principles that we follow to keep App Center secure. Although it isn't meant to be an exhaustive list of security concepts, it's shaped by a number of requests from customers for similar information.

> [!IMPORTANT]
> This documentation is meant to share information about our security stance. Nothing in this documentation implies or should be taken to mean that App Center  will never have a security issue. Nothing in this documentation supercedes any information in [Microsoft's Online Service Terms](https://www.microsoft.com/licensing/product-licensing/products). If you become aware of a potential security issue with App Center, contact the [Microsoft Security Response Center](https://www.microsoft.com/msrc) immediately.

## Data residency and sovereignty

App Center operates almost entirely in the United States. All data and processing for Apps, Users, Organizations, Build, Distribution, Analytics, Diagnostics, and Push occurs in the United States. There's no option available for hosting this customer data in any other country.

The only part of App Center that runs outside of the United States is App Center Test. App Center Test devices are located in Denmark. Data generated using App Center Test is held in Denmark and in the United States.

Content delivery networks (CDN) are used to serve some content and app releases from App Center. CDN points-of-presence are located around the world, but all source data is in the United States.

## Data security

### Encryption during transit

All network traffic in App Center, whether over the internet, or within an Azure data center, is secured with [HTTPS using TLS 1.2+](https://azure.microsoft.com/updates/azuretls12/).

### Encryption at rest

All data held by App Center is [encrypted at rest](https://docs.microsoft.com/azure/security/fundamentals/encryption-overview). We use the encryption features provided by the Microsoft Azure data storage products that we use to build App Center. These include [Azure Storage](https://docs.microsoft.com/azure/storage/common/storage-service-encryption), [Azure SQL](https://docs.microsoft.com/azure/azure-sql/database/security-overview#information-protection-and-encryption), and [Cosmos DB](https://docs.microsoft.com/azure/cosmos-db/database-encryption-at-rest).

### Encryption keys

We use system-provided keys for encryption at rest. App Center doesn't support customer-managed keys for encryption.

### Multi-tenancy

App Center is a multi-tenant system. All customer data is held within one set of data stores. There's no option to hold a customer's data in a separate or isolated set of data stores.

## Code security

App Center's code base is scanned by internal Microsoft tools for issues such as out-of-date dependencies, and known security vulnerabilities. Any issues that are found are shown in a security dashboard, and addressed by the engineering team.

To ensure that activities within the service are legitimate, as well as to detect breaches or attempted breaches, we use Azure's infrastructure to log and monitor key aspects of the service. In addition, all deployment and administrator activities are securely logged, as is operator access to production storage.

In case a possible intrusion or high priority security vulnerability has been identified, we have a clear security incident response plan. This plan outlines responsible parties, steps required to secure customer data, and how to engage with security experts in [Microsoft Security Response Center](https://www.microsoft.com/msrc) (MSRC), Microsoft Azure, and members of the App Center leadership team. We also notify any organization owners if we believe their data is disclosed or corrupted.

In general, App Center follows the [Microsoft Security Development Lifecycle](https://www.microsoft.com/securityengineering/sdl).

## Access to production systems

From time to time, Microsoft employees need access to customer data stored within App Center. All employees who have access to customer data must pass a background check, which verifies previous employment and criminal convictions. In addition, we permit access to production systems only when there's a live site incident or other approved maintenance activity. All personnel requiring access to production App Center systems are required to use a [Secure Access Workstation](https://docs.microsoft.com/windows-server/identity/securing-privileged-access/privileged-access-workstations), using just-in-time (JIT) elevation. All JIT elevation requests must be approved by another team member, and are logged and audited.

Data in App Center is classified to distinguish between customer data (what you upload to App Center), organizational data (information used when signing up for or administering your organization), and Microsoft data (information required for or collected through the operation of the service). Based on the classification we control usage scenarios, access restrictions, and retention requirements.

All logins use [Azure Active Directory multi-factor authentication](https://docs.microsoft.com/azure/active-directory/authentication/concept-mfa-howitworks) (MFA / 2FA).

## Business Continuity and Disaster Recovery (BCDR)

App Center follows internal Microsoft and Azure requirements for operating a resilient system. We participate on planning boards, regularly review our plans for business continuity and disaster recovery with appropriate internal Microsoft teams, and update those plans as necessary.

We test our disaster recovery plans on a regular basis.

## External auditing and testing

App Center hasn't pursued external audits (such as SOC 2 or ISO 27001), or external penetration testing, as few of our customers require it.

With that said, we're subject to multiple internal Microsoft, Azure, and Cloud & AI Division compliance systems and requirements. These requirements overlap significantly with what you’ll find in external audit programs. Staying in compliance with Microsoft's internal Azure requirements means that our security and business continuity stance is nearly identical to systems that have completed external audits.

## GDPR

App Center fully supports GDPR. We have [extensive documentation](https://docs.microsoft.com/appcenter/gdpr/) to explain how data is handled and how you can submit data subject requests.

## Security reporting

App Center works with the [Microsoft Security Response Center](https://www.microsoft.com/msrc) (MSRC) to address all externally reported security concerns. If you become aware of a potential security issue with App Center, contact MSRC immediately.

## See also

- [Microsoft Trust center](https://www.microsoft.com/trust-center/privacy/gdpr-overview)
- [Service Trust portal](https://servicetrust.microsoft.com/ViewPage/GDPRGetStarted)
- [Microsoft Privacy Dashboard](https://account.microsoft.com/privacy)
- [Microsoft Privacy Statement](https://privacy.microsoft.com/privacystatement)
- [Microsoft privacy response center](https://aka.ms/userprivacysite)
- [Microsoft's GDPR commitments to customers of our generally available enterprise software products](https://docs.microsoft.com/legal/gdpr)
- [Azure Data Subject Requests for the GDPR](https://docs.microsoft.com/microsoft-365/compliance/gdpr-dsr-azure)
