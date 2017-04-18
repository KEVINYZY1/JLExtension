//
//  CBPeripheral+Extension.m
//  TrudianTools
//
//  Created by 刘靖 on 2017/3/14.
//  Copyright © 2017年 刘靖. All rights reserved.
//

#import "CBPeripheral+Extension.h"

@implementation CBPeripheral (Extension)

- (BOOL)isConnect {
    if (self.state == CBPeripheralStateConnected) {
        return YES;
    }
    return NO;
}

- (BOOL)isReadwrite {
    if (self.readCharacteristic && self.writeCharacteristic) {
        return YES;
    }
    return NO;
}

- (void)setCurrentRSSI:(NSNumber *)currentRSSI {
}

- (NSNumber *)currentRSSI {
    return self.currentRSSI;
}

- (void)setReadCharacteristic:(CBCharacteristic *)readCharacteristic {
}

- (CBCharacteristic *)readCharacteristic {
    return self.readCharacteristic;
}

- (void)setWriteCharacteristic:(CBCharacteristic *)writeCharacteristic {
}

- (CBCharacteristic *)writeCharacteristic {
    return self.writeCharacteristic;
}

- (void)setMacAddress:(NSString *)macAddress {
}

- (NSString *)macAddress {
    return self.macAddress;
}

- (void)setWriteData:(NSData *)writeData {
    if (self.state == CBPeripheralStateConnected) {
        [self writeValue:writeData forCharacteristic:self.writeCharacteristic type:CBCharacteristicWriteWithoutResponse];
        [self readValueForCharacteristic:self.readCharacteristic];
    }
}

- (NSData *)writeData {
    return self.writeData;
}

@end
