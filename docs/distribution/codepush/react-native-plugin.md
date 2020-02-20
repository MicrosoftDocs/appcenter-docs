---
title: React Native Client SDK Plugin Usage
description: "How to use to the React Native SDK with CodePush"
keywords: distribution
author: Zakeelm
ms.author: zakeelm
ms.date: 12/12/2019
ms.topic: article
ms.assetid: 71AE86C4-F7DE-4E11-B3F1-B5B3449F3938
ms.service: vs-appcenter
ms.custom: distribute
---

# React Native Client SDK Plugin Usage

With the CodePush plugin downloaded and linked, and your app asking CodePush where to get the right JS bundle from, the only thing left is to add the necessary code to your app to control the following policies:

1. When (and how often) to check for an update? (for example app start, in response to clicking a button in a settings page, periodically at some fixed interval)

2. When an update is available, how to present it to the end user?

The simplest way to do this is to "CodePush-ify" your app's root component. To do so, you can choose one of the following two options:

- **Option 1: Wrap your root component with the `codePush` higher-order component:**

    ```javascript
    import codePush from "react-native-code-push";

    class MyApp extends Component {
    }

    MyApp = codePush(MyApp);
    ```

- **Option 2: Use the [ES7 decorator](https://github.com/wycats/javascript-decorators) syntax:**

  > [!NOTE]
  > Decorators are not yet supported in Babel 6.x pending proposal update.* You may need to enable it by installing and using [babel-preset-react-native-stage-0](https://github.com/skevy/babel-preset-react-native-stage-0#babel-preset-react-native-stage-0).

    ```javascript
    import codePush from "react-native-code-push";

    @codePush
    class MyApp extends Component {
    }
    ```

By default, CodePush will check for updates on every app start. If an update is available, it will be silently downloaded, and installed the next time the app is restarted (either explicitly by the end user or by the OS), which ensures the least invasive experience for your end users. If an available update is mandatory, then it will be installed immediately, ensuring that the end user gets it as soon as possible.

If you would like your app to discover updates more quickly, you can also choose to sync up with the CodePush server every time the app resumes from the background.

```javascript
let codePushOptions = { checkFrequency: codePush.CheckFrequency.ON_APP_RESUME };

class MyApp extends Component {
}

MyApp = codePush(codePushOptions)(MyApp);
```

Alternatively, if you want fine-grained control over when the check happens (like a button press or timer interval), you can call [`CodePush.sync()`](react-native-api-ref.md) at any time with your desired `SyncOptions`, and optionally turn off CodePush's automatic checking by specifying a manual `checkFrequency`:

```javascript
let codePushOptions = { checkFrequency: codePush.CheckFrequency.MANUAL };

class MyApp extends Component {
    onButtonPress() {
        codePush.sync({
            updateDialog: true,
            installMode: codePush.InstallMode.IMMEDIATE
        });
    }

    render() {
        <View>
            <TouchableOpacity onPress={this.onButtonPress}>
                <Text>Check for updates</Text>
            </TouchableOpacity>
        </View>
    }
}

MyApp = codePush(codePushOptions)(MyApp);
```

If you would like to display an update confirmation dialog (an "active install"), configure when an available update is installed (like force an immediate restart) or customize the update experience in any other way, refer to the [`codePush()`](react-native-api-ref.md) API reference for information on how to tweak this default behavior.

> [!NOTE]
> If you are using [Redux](https://redux.js.org) and [Redux Saga](https://redux-saga.js.org/), you can alternatively use the [react-native-code-push-saga](https://github.com/lostintangent/react-native-code-push-saga) module, which allows you to customize when `sync` is called in a perhaps simpler/more idiomatic way.