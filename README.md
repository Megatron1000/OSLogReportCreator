## OSLogReportCreator

OSLogReportCreator is a Swift package that allows you to generate log files from logs stored by `os.log` entries in macOS and iOS. It provides a convenient way to extract logs and generate a log file, which can be shared or analyzed further.

### Installation

You can add OSLogReportCreator to your Swift package by adding it as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/megatron1000/OSLogReportCreator.git", from: "1.0.0")
]
```

### Usage

To use OSLogReportCreator, follow these steps:

1. Import the `OSLogReportCreator` module in your Swift file:

```swift
import OSLogReportCreator
```

2. Create an instance of the `OSLogReportCreator` class:

```swift
let logReportCreator = OSLogReportCreator()
```

3. Generate a log file URL using the `generateLogFile()` function:

```swift
do {
    let logURL = try await logReportCreator.generateLogFile()
    ActivityViewControllerPresenter.presentActivityViewController(activityItems: [logURL])
} catch {
    os_log("Error generating log file %{public}@", log: myLog, type: .default, error.localizedDescription)
}
```

The `generateLogFile()` function asynchronously generates a log file URL. You can use this URL to perform actions like presenting a share activity view controller to allow users to share or save the log file. If an error occurs during the log file generation, it can be caught and logged using `os_log`.

### Example

Here's an example of how to use OSLogReportCreator in your code:

```swift
import OSLogReportCreator

do {
    let logURL = try await logReportCreator.generateLogFile()
    ActivityViewControllerPresenter.presentActivityViewController(activityItems: [logURL])
} catch {
    os_log("Error generating log file %{public}@", log: myLog, type: .default, error.localizedDescription)
}
```

In this example, the `generateLogFile()` function is used to generate a log file URL. If successful, it presents a share activity view controller with the log file URL. If an error occurs, it logs the error description using `os_log`.

### Compatibility

OSLogReportCreator is compatible with macOS and iOS systems that support `os.log` entries.

### License

OSLogReportCreator is released under the [MIT License](https://opensource.org/licenses/MIT). See the `LICENSE` file for more information.

### Contributing

Contributions to OSLogReportCreator are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request on the [GitHub repository](https://github.com/megatron1000/OSLogReportCreator).
