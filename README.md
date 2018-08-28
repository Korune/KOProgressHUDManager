# KOProgressHUDManager —— iOS 的 HUD 简易封装

## 简介
何为 HUD ？即透明指示层，如下图中间部分:
![Image text](https://raw.githubusercontent.com/Korune/KOProgressHUDManager/master/screenshots/1.png)

HUD 在 iOS 中的界面展示中用的比较多。iOS 开发中最常用的 HUD 要数 MBProgressHUD 和 SVProgressHUD。很多开发者把 HUD 封装的比较复杂，本着简单、好用的原则，于是对 MBProgressHUD 进行了简易封装。地址：[https://github.com/Korune/KOProgressHUDManager](https://github.com/Korune/KOProgressHUDManager)，后面也会不定期更新。

## 思路
1. 每个 `+ show...` 方法，最后调用的是 `+ showText: icon: mode: onView: duration:` 方法。在上面说的第二个方法中，进行 `MBProgressHUD` 的初始化、相关设置。
2. 封装 `MBProgressHUD`，没有通过添加 `MBProgressHUD` 分类来实现，而是通过 `KOProgressHUDManager` 继承 `NSObject` 来实现，在 `MBProgressHUD` 的基础上多封装了一层 `KOProgressHUDManager`。 是避免以后改为使用其他第三方 `HUD`（比如 `SVProgressHUD` 等）时，将项目中凡是用到 `MBProgressHUD` 类的很多地方的代码，都改为第三方 `HUD` 类。

## 关键代码

```objc
+ (void)showText:(NSString *)text icon:(UIImage *)icon mode:(MBProgressHUDMode)mode onView:(UIView *)view duration:(CGFloat)duration
{
    if (view == nil) {
        view = [UIApplication sharedApplication].delegate.window;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabel.text = text;
    if (mode != MBProgressHUDModeText) {
        hud.mode = mode;
    } else {
        if (icon == nil) {
            hud.mode = MBProgressHUDModeText;
        } else {
            hud.mode = MBProgressHUDModeCustomView;
            hud.customView = [[UIImageView alloc] initWithImage:icon];
        }
    }
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.removeFromSuperViewOnHide = YES;
    if (duration != kKOFastFutureDuration) {
        [hud hideAnimated:YES afterDelay:duration];
    }
    hud.margin = 10;
    [self setupHUDAppearance:hud];
}

+ (void)setupHUDAppearance:(MBProgressHUD *)hud
{
        hud.detailsLabel.font = [UIFont systemFontOfSize:15];
//        hud.detailsLabel.textColor = [UIColor whiteColor];
    //    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //    hud.bezelView.backgroundColor = [UIColor brownColor];
}
```

## KOProgressHUDManager 的使用

```objc
#pragma mark -

- (IBAction)showSuccess:(id)sender {
    [KOProgressHUDManager showSuccess:@"小伙子，你成功了！"];
}

- (IBAction)showError:(id)sender {
    [KOProgressHUDManager showError:@"小伙子，暂时失败了，不要灰心!" duration:2];
}

- (IBAction)showLoading:(id)sender {
    [KOProgressHUDManager showLoading:@"小伙子，等等……" onView:self.view];
}

- (IBAction)hideHUD:(id)sender {
    [KOProgressHUDManager hideHUDForView:self.view];
}
```

## 截图
![Image text](https://raw.githubusercontent.com/Korune/KOProgressHUDManager/master/screenshots/2.png)
