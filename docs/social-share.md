# Social share

For now we only put a iOS WeChat social share demo.

## WeChat social share in iOS

We use [fluwx](https://github.com/OpenFlutter/fluwx) to do the work, but what really matters here is intergrating WeChat SDK in iOS. There are things need to be configured in three places:

- app itself
- WeChat open platform
- app server

And here is a flowchart to help you understand:

![](https://s2.loli.net/2023/03/08/WGJgpQynOsFKh67.png)

If you don't know about `universalLink`, check [Apple document](https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content) about it.

## Docs

- [Apple document - universalLink](https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content)
- [GM Flutter APP Social Share Investigation](https://wiredcraft.atlassian.net/wiki/spaces/knowledge/pages/756318339/GM+Flutter+APP+Social+Share+Investigation)
- [Fluwx](https://pub.dev/packages/fluwx)
- [WeChat SDK Access Guide for iOS](https://developers.weixin.qq.com/doc/oplatform/en/Mobile_App/Access_Guide/iOS.html)

## ScreenShots

The iOS WeChat share won't actually work because we don't have

- a real Univerallink
- a real WeChat open platform AppId

for boilerplate, so WeChat will show an error.

![](https://s2.loli.net/2023/03/06/1XvRB8twcu35ZPq.gif)