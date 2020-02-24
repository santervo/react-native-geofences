#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(Geofences, RCTEventEmitter)

RCT_EXTERN_METHOD(addGeofence:(NSDictionary *)params resolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(removeGeofence:(NSString *)id resolver: (RCTPromiseResolveBlock)resolve rejecter: (RCTPromiseRejectBlock)reject)

@end
