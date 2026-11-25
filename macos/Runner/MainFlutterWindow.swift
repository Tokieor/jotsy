import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    // 记住窗口大小与位置：AppKit 按这个名字把 frame 存进应用偏好，
    // 下次启动时自动恢复（Flutter 的 macOS 模板默认不做这件事）。
    _ = self.setFrameAutosaveName("JotsyMainWindow")
    // 缩到很小时窗口不能被压扁到看不见内容，给一个下限。
    self.minSize = NSSize(width: 480, height: 360)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
