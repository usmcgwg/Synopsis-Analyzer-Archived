//
//  OpenCVAnalyzerPlugin.m
//  MetadataTranscoderTestHarness
//
//  Created by vade on 4/3/15.
//  Copyright (c) 2015 metavisual. All rights reserved.
//

// Include OpenCV before anything else because FUCK C++
#import "opencv.hpp"

#import <AVFoundation/AVFoundation.h>
#import "OpenCVAnalyzerPlugin.h"

@interface OpenCVAnalyzerPlugin ()

@property (atomic, readwrite, strong) NSString* pluginName;
@property (atomic, readwrite, strong) NSString* pluginIdentifier;

@property (atomic, readwrite, strong) NSArray* pluginAuthors;

@property (atomic, readwrite, strong) NSString* pluginDescription;

@property (atomic, readwrite, assign) NSUInteger pluginAPIVersionMajor;
@property (atomic, readwrite, assign) NSUInteger pluginAPIVersionMinor;

@property (atomic, readwrite, assign) NSUInteger pluginVersionMajor;
@property (atomic, readwrite, assign) NSUInteger pluginVersionMinor;

@property (atomic, readwrite, strong) NSDictionary* pluginReturnedMetadataKeysAndDataTypes;

@property (atomic, readwrite, strong) NSString* pluginMediaType;

@end

@implementation OpenCVAnalyzerPlugin

- (id) init
{
    self = [super init];
    if(self)
    {
        self.pluginName = @"OpenCV Analyzer";
        self.pluginIdentifier = @"org.metavisual.OpenCVAnalyzer";
        self.pluginAuthors = @[@"Anton Marini"];
        self.pluginDescription = @"OpenCV analyzer";
        self.pluginAPIVersionMajor = 0;
        self.pluginAPIVersionMinor = 1;
        self.pluginVersionMajor = 0;
        self.pluginVersionMinor = 1;
        self.pluginMediaType = AVMediaTypeVideo;
    }
    
    return self;
}


- (void) beginMetadataAnalysisSession
{
    
}

- (NSDictionary*) analyzedMetadataDictionaryForSampleBuffer:(CMSampleBufferRef)sampleBuffer error:(NSError**) error
{
    // Step 1, grab a CVImageBuffer from our CMSampleBuffer
    // This requires our sample buffer to be decoded, not passthrough.
    CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    
    // Early Bail
    if(pixelBuffer)
    {
        // All pixel buffers are BGRA 
    }
    
    // No pixelbuffer in our sample buffer. Thats bad.
    else
    {
        NSError* noPixelBufferError = [[NSError alloc] initWithDomain:@"Metavisual.noPixelBufferInSampleBuffer" code:-666 userInfo:nil];
        
        *error = noPixelBufferError;
        
        return nil;

    }
    
    
    return nil;
}

- (NSDictionary*) finalizeMetadataAnalysisSessionWithError:(NSError**)error
{
    return nil;    
}

@end