//
//  RCTKSYVideoManager.m
//  RCTKSYVideo
//
//  Created by mayudong on 2017/11/27.
//  Copyright © 2017年 mayudong. All rights reserved.
//
#import "RCTKSYVideoManager.h"
#import "RCTKSYVideo.h"
#import <AVFoundation/AVFoundation.h>

#import <React/RCTViewManager.h>
#import <React/RCTUIManager.h>
#import <React/RCTLog.h>

@implementation RCTKSYVideoManager

RCT_EXPORT_MODULE()

@synthesize bridge = _bridge;

- (UIView *)view
{
    return [[RCTKSYVideo alloc]initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_VIEW_PROPERTY(src, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(seek, float);
RCT_EXPORT_VIEW_PROPERTY(timeout, NSDictionary);
RCT_EXPORT_VIEW_PROPERTY(bufferTime, float);
RCT_EXPORT_VIEW_PROPERTY(bufferSize, float);
RCT_EXPORT_VIEW_PROPERTY(resizeMode, NSString);
RCT_EXPORT_VIEW_PROPERTY(repeat, BOOL);
RCT_EXPORT_VIEW_PROPERTY(paused, BOOL);
RCT_EXPORT_VIEW_PROPERTY(muted, BOOL);
RCT_EXPORT_VIEW_PROPERTY(mirror, BOOL);
RCT_EXPORT_VIEW_PROPERTY(volume, float);
RCT_EXPORT_VIEW_PROPERTY(degree, int);
RCT_EXPORT_VIEW_PROPERTY(playInBackground, BOOL);
//RCT_EXPORT_VIEW_PROPERTY(playWhenInactive, BOOL);


RCT_EXPORT_VIEW_PROPERTY(onVideoTouch, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoLoadStart, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoLoad, RCTBubblingEventBlock);

RCT_EXPORT_VIEW_PROPERTY(onVideoError, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoProgress, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoSeek, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onVideoEnd, RCTBubblingEventBlock);

RCT_EXPORT_VIEW_PROPERTY(onReadyForDisplay, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPlaybackStalled, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onPlaybackResume, RCTBubblingEventBlock);

RCT_EXPORT_VIEW_PROPERTY(onVideoSaveBitmap, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onRecordVideo, RCTBubblingEventBlock);
RCT_EXPORT_VIEW_PROPERTY(onStopRecordVideo, RCTBubblingEventBlock);

RCT_EXPORT_METHOD(saveBitmap:(nonnull NSNumber*) reactTag) {
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        RCTKSYVideo *ksyVideo = viewRegistry[reactTag];
        if (!ksyVideo || ![ksyVideo isKindOfClass:[RCTKSYVideo class]]) {
            RCTLogError(@"Cannot find RCTKSYVideo with tag #%@", reactTag);
            return;
        }
        [ksyVideo saveBitmap:nil];
    }];
}

RCT_EXPORT_METHOD(recordVideo:(nonnull NSNumber*) reactTag) {
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        RCTKSYVideo *ksyVideo = viewRegistry[reactTag];
        if (!ksyVideo || ![ksyVideo isKindOfClass:[RCTKSYVideo class]]) {
            RCTLogError(@"Cannot find RCTKSYVideo with tag #%@", reactTag);
            return;
        }
        [ksyVideo recordVideo:nil];
    }];
}

RCT_EXPORT_METHOD(stopRecordVideo:(nonnull NSNumber*) reactTag) {
    [self.bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *,UIView *> *viewRegistry) {
        RCTKSYVideo *ksyVideo = viewRegistry[reactTag];
        if (!ksyVideo || ![ksyVideo isKindOfClass:[RCTKSYVideo class]]) {
            RCTLogError(@"Cannot find RCTKSYVideo with tag #%@", reactTag);
            return;
        }
        [ksyVideo stopRecordVideo:nil];
    }];
}

@end
