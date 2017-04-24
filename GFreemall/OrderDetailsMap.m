//
//  OrderDetailsMap.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderDetailsMap.h"
#import "OrderDetailsCommodity.h"


NSString *const kOrderDetailsMapBaseUuid = @"base_uuid";
NSString *const kOrderDetailsMapOrderTime = @"order_time";
NSString *const kOrderDetailsMapAddressZipcode = @"address_zipcode";
NSString *const kOrderDetailsMapAddressArea = @"address_area";
NSString *const kOrderDetailsMapOrderPaytime = @"order_paytime";
NSString *const kOrderDetailsMapAddressProvince = @"address_province";
NSString *const kOrderDetailsMapAddressCity = @"address_city";
NSString *const kOrderDetailsMapOrderPayIsmain = @"order_pay_ismain";
NSString *const kOrderDetailsMapOrderState = @"order_state";
NSString *const kOrderDetailsMapOrderPayFreight = @"order_pay_freight";
NSString *const kOrderDetailsMapOrderSend = @"order_send";
NSString *const kOrderDetailsMapOrderCanceltime = @"order_canceltime";
NSString *const kOrderDetailsMapAddressPhone = @"address_phone";
NSString *const kOrderDetailsMapOrderSerial = @"order_serial";
NSString *const kOrderDetailsMapOrderSendtime = @"order_sendtime";
NSString *const kOrderDetailsMapOrderAmount = @"order_amount";
NSString *const kOrderDetailsMapId = @"id";
NSString *const kOrderDetailsMapAddressAddress = @"address_address";
NSString *const kOrderDetailsMapOrderLogCompany = @"order_log_company";
NSString *const kOrderDetailsMapOrderFreight = @"order_freight";
NSString *const kOrderDetailsMapAddressName = @"address_name";
NSString *const kOrderDetailsMapOrderSubSerial = @"order_sub_serial";
NSString *const kOrderDetailsMapAddressCountry = @"address_country";
NSString *const kOrderDetailsMapOrderPayAmount = @"order_pay_amount";
NSString *const kOrderDetailsMapOrderPayState = @"order_pay_state";
NSString *const kOrderDetailsMapOrderPayment = @"order_payment";
NSString *const kOrderDetailsMapCommodity = @"commodity";
NSString *const kOrderDetailsMapOrderLogOrder = @"order_log_order";
NSString *const kOrderDetailsMapOrderIsshow = @"order_isshow";


@interface OrderDetailsMap ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderDetailsMap

@synthesize baseUuid = _baseUuid;
@synthesize orderTime = _orderTime;
@synthesize addressZipcode = _addressZipcode;
@synthesize addressArea = _addressArea;
@synthesize orderPaytime = _orderPaytime;
@synthesize addressProvince = _addressProvince;
@synthesize addressCity = _addressCity;
@synthesize orderPayIsmain = _orderPayIsmain;
@synthesize orderState = _orderState;
@synthesize orderPayFreight = _orderPayFreight;
@synthesize orderSend = _orderSend;
@synthesize orderCanceltime = _orderCanceltime;
@synthesize addressPhone = _addressPhone;
@synthesize orderSerial = _orderSerial;
@synthesize orderSendtime = _orderSendtime;
@synthesize orderAmount = _orderAmount;
@synthesize mapIdentifier = _mapIdentifier;
@synthesize addressAddress = _addressAddress;
@synthesize orderLogCompany = _orderLogCompany;
@synthesize orderFreight = _orderFreight;
@synthesize addressName = _addressName;
@synthesize orderSubSerial = _orderSubSerial;
@synthesize addressCountry = _addressCountry;
@synthesize orderPayAmount = _orderPayAmount;
@synthesize orderPayState = _orderPayState;
@synthesize orderPayment = _orderPayment;
@synthesize commodity = _commodity;
@synthesize orderLogOrder = _orderLogOrder;
@synthesize orderIsshow = _orderIsshow;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.baseUuid = [[self objectOrNilForKey:kOrderDetailsMapBaseUuid fromDictionary:dict] doubleValue];
            self.orderTime = [self objectOrNilForKey:kOrderDetailsMapOrderTime fromDictionary:dict];
            self.addressZipcode = [self objectOrNilForKey:kOrderDetailsMapAddressZipcode fromDictionary:dict];
            self.addressArea = [self objectOrNilForKey:kOrderDetailsMapAddressArea fromDictionary:dict];
            self.orderPaytime = [self objectOrNilForKey:kOrderDetailsMapOrderPaytime fromDictionary:dict];
            self.addressProvince = [self objectOrNilForKey:kOrderDetailsMapAddressProvince fromDictionary:dict];
            self.addressCity = [self objectOrNilForKey:kOrderDetailsMapAddressCity fromDictionary:dict];
            self.orderPayIsmain = [[self objectOrNilForKey:kOrderDetailsMapOrderPayIsmain fromDictionary:dict] doubleValue];
            self.orderState = [[self objectOrNilForKey:kOrderDetailsMapOrderState fromDictionary:dict] doubleValue];
            self.orderPayFreight = [[self objectOrNilForKey:kOrderDetailsMapOrderPayFreight fromDictionary:dict] doubleValue];
            self.orderSend = [self objectOrNilForKey:kOrderDetailsMapOrderSend fromDictionary:dict];
            self.orderCanceltime = [self objectOrNilForKey:kOrderDetailsMapOrderCanceltime fromDictionary:dict];
            self.addressPhone = [self objectOrNilForKey:kOrderDetailsMapAddressPhone fromDictionary:dict];
            self.orderSerial = [[self objectOrNilForKey:kOrderDetailsMapOrderSerial fromDictionary:dict] doubleValue];
            self.orderSendtime = [self objectOrNilForKey:kOrderDetailsMapOrderSendtime fromDictionary:dict];
            self.orderAmount = [[self objectOrNilForKey:kOrderDetailsMapOrderAmount fromDictionary:dict] doubleValue];
            self.mapIdentifier = [[self objectOrNilForKey:kOrderDetailsMapId fromDictionary:dict] doubleValue];
            self.addressAddress = [self objectOrNilForKey:kOrderDetailsMapAddressAddress fromDictionary:dict];
            self.orderLogCompany = [self objectOrNilForKey:kOrderDetailsMapOrderLogCompany fromDictionary:dict];
            self.orderFreight = [[self objectOrNilForKey:kOrderDetailsMapOrderFreight fromDictionary:dict] doubleValue];
            self.addressName = [self objectOrNilForKey:kOrderDetailsMapAddressName fromDictionary:dict];
            self.orderSubSerial = [self objectOrNilForKey:kOrderDetailsMapOrderSubSerial fromDictionary:dict];
            self.addressCountry = [self objectOrNilForKey:kOrderDetailsMapAddressCountry fromDictionary:dict];
            self.orderPayAmount = [[self objectOrNilForKey:kOrderDetailsMapOrderPayAmount fromDictionary:dict] doubleValue];
            self.orderPayState = [[self objectOrNilForKey:kOrderDetailsMapOrderPayState fromDictionary:dict] doubleValue];
            self.orderPayment = [[self objectOrNilForKey:kOrderDetailsMapOrderPayment fromDictionary:dict] doubleValue];
    NSObject *receivedOrderDetailsCommodity = [dict objectForKey:kOrderDetailsMapCommodity];
    NSMutableArray *parsedOrderDetailsCommodity = [NSMutableArray array];
    
    if ([receivedOrderDetailsCommodity isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOrderDetailsCommodity) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOrderDetailsCommodity addObject:[OrderDetailsCommodity modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOrderDetailsCommodity isKindOfClass:[NSDictionary class]]) {
       [parsedOrderDetailsCommodity addObject:[OrderDetailsCommodity modelObjectWithDictionary:(NSDictionary *)receivedOrderDetailsCommodity]];
    }

    self.commodity = [NSArray arrayWithArray:parsedOrderDetailsCommodity];
            self.orderLogOrder = [self objectOrNilForKey:kOrderDetailsMapOrderLogOrder fromDictionary:dict];
            self.orderIsshow = [[self objectOrNilForKey:kOrderDetailsMapOrderIsshow fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kOrderDetailsMapBaseUuid];
    [mutableDict setValue:self.orderTime forKey:kOrderDetailsMapOrderTime];
    [mutableDict setValue:self.addressZipcode forKey:kOrderDetailsMapAddressZipcode];
    [mutableDict setValue:self.addressArea forKey:kOrderDetailsMapAddressArea];
    [mutableDict setValue:self.orderPaytime forKey:kOrderDetailsMapOrderPaytime];
    [mutableDict setValue:self.addressProvince forKey:kOrderDetailsMapAddressProvince];
    [mutableDict setValue:self.addressCity forKey:kOrderDetailsMapAddressCity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayIsmain] forKey:kOrderDetailsMapOrderPayIsmain];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderState] forKey:kOrderDetailsMapOrderState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayFreight] forKey:kOrderDetailsMapOrderPayFreight];
    [mutableDict setValue:self.orderSend forKey:kOrderDetailsMapOrderSend];
    [mutableDict setValue:self.orderCanceltime forKey:kOrderDetailsMapOrderCanceltime];
    [mutableDict setValue:self.addressPhone forKey:kOrderDetailsMapAddressPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kOrderDetailsMapOrderSerial];
    [mutableDict setValue:self.orderSendtime forKey:kOrderDetailsMapOrderSendtime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderAmount] forKey:kOrderDetailsMapOrderAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mapIdentifier] forKey:kOrderDetailsMapId];
    [mutableDict setValue:self.addressAddress forKey:kOrderDetailsMapAddressAddress];
    [mutableDict setValue:self.orderLogCompany forKey:kOrderDetailsMapOrderLogCompany];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderFreight] forKey:kOrderDetailsMapOrderFreight];
    [mutableDict setValue:self.addressName forKey:kOrderDetailsMapAddressName];
    [mutableDict setValue:self.orderSubSerial forKey:kOrderDetailsMapOrderSubSerial];
    [mutableDict setValue:self.addressCountry forKey:kOrderDetailsMapAddressCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayAmount] forKey:kOrderDetailsMapOrderPayAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayState] forKey:kOrderDetailsMapOrderPayState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayment] forKey:kOrderDetailsMapOrderPayment];
    NSMutableArray *tempArrayForCommodity = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.commodity) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCommodity addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCommodity addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommodity] forKey:kOrderDetailsMapCommodity];
    [mutableDict setValue:self.orderLogOrder forKey:kOrderDetailsMapOrderLogOrder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderIsshow] forKey:kOrderDetailsMapOrderIsshow];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.baseUuid = [aDecoder decodeDoubleForKey:kOrderDetailsMapBaseUuid];
    self.orderTime = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderTime];
    self.addressZipcode = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressZipcode];
    self.addressArea = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressArea];
    self.orderPaytime = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderPaytime];
    self.addressProvince = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressProvince];
    self.addressCity = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressCity];
    self.orderPayIsmain = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderPayIsmain];
    self.orderState = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderState];
    self.orderPayFreight = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderPayFreight];
    self.orderSend = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderSend];
    self.orderCanceltime = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderCanceltime];
    self.addressPhone = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressPhone];
    self.orderSerial = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderSerial];
    self.orderSendtime = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderSendtime];
    self.orderAmount = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderAmount];
    self.mapIdentifier = [aDecoder decodeDoubleForKey:kOrderDetailsMapId];
    self.addressAddress = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressAddress];
    self.orderLogCompany = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderLogCompany];
    self.orderFreight = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderFreight];
    self.addressName = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressName];
    self.orderSubSerial = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderSubSerial];
    self.addressCountry = [aDecoder decodeObjectForKey:kOrderDetailsMapAddressCountry];
    self.orderPayAmount = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderPayAmount];
    self.orderPayState = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderPayState];
    self.orderPayment = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderPayment];
    self.commodity = [aDecoder decodeObjectForKey:kOrderDetailsMapCommodity];
    self.orderLogOrder = [aDecoder decodeObjectForKey:kOrderDetailsMapOrderLogOrder];
    self.orderIsshow = [aDecoder decodeDoubleForKey:kOrderDetailsMapOrderIsshow];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_baseUuid forKey:kOrderDetailsMapBaseUuid];
    [aCoder encodeObject:_orderTime forKey:kOrderDetailsMapOrderTime];
    [aCoder encodeObject:_addressZipcode forKey:kOrderDetailsMapAddressZipcode];
    [aCoder encodeObject:_addressArea forKey:kOrderDetailsMapAddressArea];
    [aCoder encodeObject:_orderPaytime forKey:kOrderDetailsMapOrderPaytime];
    [aCoder encodeObject:_addressProvince forKey:kOrderDetailsMapAddressProvince];
    [aCoder encodeObject:_addressCity forKey:kOrderDetailsMapAddressCity];
    [aCoder encodeDouble:_orderPayIsmain forKey:kOrderDetailsMapOrderPayIsmain];
    [aCoder encodeDouble:_orderState forKey:kOrderDetailsMapOrderState];
    [aCoder encodeDouble:_orderPayFreight forKey:kOrderDetailsMapOrderPayFreight];
    [aCoder encodeObject:_orderSend forKey:kOrderDetailsMapOrderSend];
    [aCoder encodeObject:_orderCanceltime forKey:kOrderDetailsMapOrderCanceltime];
    [aCoder encodeObject:_addressPhone forKey:kOrderDetailsMapAddressPhone];
    [aCoder encodeDouble:_orderSerial forKey:kOrderDetailsMapOrderSerial];
    [aCoder encodeObject:_orderSendtime forKey:kOrderDetailsMapOrderSendtime];
    [aCoder encodeDouble:_orderAmount forKey:kOrderDetailsMapOrderAmount];
    [aCoder encodeDouble:_mapIdentifier forKey:kOrderDetailsMapId];
    [aCoder encodeObject:_addressAddress forKey:kOrderDetailsMapAddressAddress];
    [aCoder encodeObject:_orderLogCompany forKey:kOrderDetailsMapOrderLogCompany];
    [aCoder encodeDouble:_orderFreight forKey:kOrderDetailsMapOrderFreight];
    [aCoder encodeObject:_addressName forKey:kOrderDetailsMapAddressName];
    [aCoder encodeObject:_orderSubSerial forKey:kOrderDetailsMapOrderSubSerial];
    [aCoder encodeObject:_addressCountry forKey:kOrderDetailsMapAddressCountry];
    [aCoder encodeDouble:_orderPayAmount forKey:kOrderDetailsMapOrderPayAmount];
    [aCoder encodeDouble:_orderPayState forKey:kOrderDetailsMapOrderPayState];
    [aCoder encodeDouble:_orderPayment forKey:kOrderDetailsMapOrderPayment];
    [aCoder encodeObject:_commodity forKey:kOrderDetailsMapCommodity];
    [aCoder encodeObject:_orderLogOrder forKey:kOrderDetailsMapOrderLogOrder];
    [aCoder encodeDouble:_orderIsshow forKey:kOrderDetailsMapOrderIsshow];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderDetailsMap *copy = [[OrderDetailsMap alloc] init];
    
    
    
    if (copy) {

        copy.baseUuid = self.baseUuid;
        copy.orderTime = self.orderTime;
        copy.addressZipcode = [self.addressZipcode copyWithZone:zone];
        copy.addressArea = [self.addressArea copyWithZone:zone];
        copy.orderPaytime = [self.orderPaytime copyWithZone:zone];
        copy.addressProvince = [self.addressProvince copyWithZone:zone];
        copy.addressCity = [self.addressCity copyWithZone:zone];
        copy.orderPayIsmain = self.orderPayIsmain;
        copy.orderState = self.orderState;
        copy.orderPayFreight = self.orderPayFreight;
        copy.orderSend = [self.orderSend copyWithZone:zone];
        copy.orderCanceltime = [self.orderCanceltime copyWithZone:zone];
        copy.addressPhone = [self.addressPhone copyWithZone:zone];
        copy.orderSerial = self.orderSerial;
        copy.orderSendtime = [self.orderSendtime copyWithZone:zone];
        copy.orderAmount = self.orderAmount;
        copy.mapIdentifier = self.mapIdentifier;
        copy.addressAddress = [self.addressAddress copyWithZone:zone];
        copy.orderLogCompany = [self.orderLogCompany copyWithZone:zone];
        copy.orderFreight = self.orderFreight;
        copy.addressName = [self.addressName copyWithZone:zone];
        copy.orderSubSerial = [self.orderSubSerial copyWithZone:zone];
        copy.addressCountry = [self.addressCountry copyWithZone:zone];
        copy.orderPayAmount = self.orderPayAmount;
        copy.orderPayState = self.orderPayState;
        copy.orderPayment = self.orderPayment;
        copy.commodity = [self.commodity copyWithZone:zone];
        copy.orderLogOrder = [self.orderLogOrder copyWithZone:zone];
        copy.orderIsshow = self.orderIsshow;
    }
    
    return copy;
}


@end
