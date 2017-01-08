//
//  ViewController.m
//  TestVideoPauseAndDownloadDelect
//
//  Created by HMRL on 16/12/29.
//  Copyright © 2016年 HMRL. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

#define videoUrl @"https://flv.bn.netease.com/tvmrepo/2016/12/V/I/EC8HGLIVI/SD/EC8HGLIVI-mobile.mp4"

@interface ViewController ()

@property (strong, nonatomic) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self video];
}

- (void)video{
    

    NSURL *url = [NSURL URLWithString:videoUrl];
    
    AVPlayerViewController *vc = [[AVPlayerViewController alloc] init];
    vc.player = [[AVPlayer alloc] initWithURL:url];
    vc.view.frame = self.view.frame;
    vc.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height / 2);
    
    [self addChildViewController:vc];//这句不写貌似AVPlayerViewController也不会挂掉
    [self.view addSubview:vc.view];
    
    [vc.player play];


}

//自定义UI界面的播放器，原生AVPlayerLayer类来做，框架的话 ，VKVideoPlayer ，ZFPlayer VLC,FFmpeg，kxmovie 基于FFmpeg，并且支持多格式

//Mark 3.视频录制,

/*mark 4.视频格式,是视频播放软件为了能够播放视频文件而赋予视频文件的一种识别符号。
 视频格式可以分为适合本地播放的本地影像视频和适合在网络中播放的网络流媒体影像视频两大类。
 视频格式貌似跟压缩算法有关
 
 本地的：
 网络的；
 */

/*5.视频编码方式,就是指通过特定的压缩技术，将某个视频格式的文件转换成另一种视频格式文件的方式。
 */

/*6.转换器,
 */
/*7.转换类型,
 */
/*8.手机视频格式， 指用手机观看的, 存储在手机内存或者存储卡上的视频内容的格式。 这些格式区别于用手机浏览器观看的网络流媒体视频格式.
 */

/*9.视频码率.通俗一点的理解就是取样率，单位时间内取样率越大，精度就越高，处理出来的文件就越接近原始文件，但是文件体积与取样率是成正比的，所以几乎所有的编码格式重视的都是如何用最低的码率达到最少的失真，围绕这个核心衍生出来的cbr（固定码率）与vbr（可变码率），都是在这方面做的文章，不过事情总不是绝对的，举例来看，对于一个音频，其码率越高，被压缩的比例越小，音质损失越小，与音源的音质越接近。
 */

/*10.视频帧率,（Frame rate）是用于测量显示帧数的量度。所谓的测量单位为每秒显示帧数(Frames per Second，简：FPS）或“赫兹”（Hz）.每秒的帧数(fps)或者说帧率表示图形处理器处理场时每秒钟能够更新的次数。高的帧率可以得到更流畅、更逼真的动画。
 */
/*11.# 请注意，视频码率+音频码率之和, 不要大于384kbps, 否则有些手机无法流畅播放。
 */

/*12.播放器,也就是播放软件。在视频播放过程中， 需要软件来识别各类视频文件封装(即通常所说的'格式'), 将数据'拆封'后， 交由解码芯片去做解码处理, 然后将解码后的数据实现播放。 这个'拆封'和播放的任务， 要由播放软件(播放器)完成.
 一般播放器都能识别多种视频封装(即文件格式), 例如， Coreplayer能播放AVI, WMV, MP4等多种格式， RUN播放器能播放rm, rmvb格式的视频。
 
 */

/*13.文件格式,大家所看到的文件名后缀， 如： MP4, 3GP, WMV, AVI,RM, RMVB等等. 实际上， 这些都是封装类型, 真正的视频格式不是文件名而是文件内的视频编码方案和音频编码方案。 能够播放哪些文件，实际取决于使用了哪个播放器, 以及硬件解码芯片能否识别该文件内的编码方案.

 */

@end
