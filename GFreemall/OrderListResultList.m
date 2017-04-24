//
//  OrderListResultList.m
//
//  Created by   on 2017/4/24
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "OrderListResultList.h"
#import "OrderListCommodity.h"


NSString *const kOrderListResultListOrderPayment = @"order_payment";
NSString *const kOrderListResultListAddressZipcode = @"address_zipcode";
NSString *const kOrderListResultListCommodityQuantity = @"commodity_quantity";
NSString *const kOrderListResultListOrderSerialOrder = @"order_serial_order";
NSString *const kOrderListResultListAddressArea = @"address_area";
NSString *const kOrderListResultListAddressProvince = @"address_province";
NSString *const kOrderListResultListAddressCity = @"address_city";
NSString *const kOrderListResultListOrderLogOrder = @"order_log_order";
NSString *const kOrderListResultListCommodityAttributes = @"commodity_attributes";
NSString *const kOrderListResultListCommodityFreight = @"commodity_freight";
NSString *const kOrderListResultListOrderState = @"order_state";
NSString *const kOrderListResultListBaseUuid = @"base_uuid";
NSString *const kOrderListResultListAddressPhone = @"address_phone";
NSString *const kOrderListResultListOrderSerial = @"order_serial";
NSString *const kOrderListResultListCategorySerial = @"category_serial";
NSString *const kOrderListResultListOrderId = @"order_id";
NSString *const kOrderListResultListOrderAmount = @"order_amount";
NSString *const kOrderListResultListId = @"id";
NSString *const kOrderListResultListAddressAddress = @"address_address";
NSString *const kOrderListResultListOrderLogCompany = @"order_log_company";
NSString *const kOrderListResultListBrandSerial = @"brand_serial";
NSString *const kOrderListResultListOrderFreight = @"order_freight";
NSString *const kOrderListResultListAddressName = @"address_name";
NSString *const kOrderListResultListCommoditySellprice = @"commodity_sellprice";
NSString *const kOrderListResultListAddressCountry = @"address_country";
NSString *const kOrderListResultListCommoditySerial = @"commodity_serial";
NSString *const kOrderListResultListCommodity = @"commodity";
NSString *const kOrderListResultListCommodityName = @"commodity_name";
NSString *const kOrderListResultListOrderTime = @"order_time";


@interface OrderListResultList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OrderListResultList

@synthesize orderPayment = _orderPayment;
@synthesize addressZipcode = _addressZipcode;
@synthesize commodityQuantity = _commodityQuantity;
@synthesize orderSerialOrder = _orderSerialOrder;
@synthesize addressArea = _addressArea;
@synthesize addressProvince = _addressProvince;
@synthesize addressCity = _addressCity;
@synthesize orderLogOrder = _orderLogOrder;
@synthesize commodityAttributes = _commodityAttributes;
@synthesize commodityFreight = _commodityFreight;
@synthesize orderState = _orderState;
@synthesize baseUuid = _baseUuid;
@synthesize addressPhone = _addressPhone;
@synthesize orderSerial = _orderSerial;
@synthesize categorySerial = _categorySerial;
@synthesize orderId = _orderId;
@synthesize orderAmount = _orderAmount;
@synthesize resultListIdentifier = _resultListIdentifier;
@synthesize addressAddress = _addressAddress;
@synthesize orderLogCompany = _orderLogCompany;
@synthesize brandSerial = _brandSerial;
@synthesize orderFreight = _orderFreight;
@synthesize addressName = _addressName;
@synthesize commoditySellprice = _commoditySellprice;
@synthesize addressCountry = _addressCountry;
@synthesize commoditySerial = _commoditySerial;
@synthesize commodity = _commodity;
@synthesize commodityName = _commodityName;
@synthesize orderTime = _orderTime;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.orderPayment = [[self objectOrNilForKey:kOrderListResultListOrderPayment fromDictionary:dict] doubleValue];
            self.addressZipcode = [self objectOrNilForKey:kOrderListResultListAddressZipcode fromDictionary:dict];
            self.commodityQuantity = [[self objectOrNilForKey:kOrderListResultListCommodityQuantity fromDictionary:dict] doubleValue];
            self.orderSerialOrder = [[self objectOrNilForKey:kOrderListResultListOrderSerialOrder fromDictionary:dict] doubleValue];
            self.addressArea = [self objectOrNilForKey:kOrderListResultListAddressArea fromDictionary:dict];
            self.addressProvince = [self objectOrNilForKey:kOrderListResultListAddressProvince fromDictionary:dict];
            self.addressCity = [self objectOrNilForKey:kOrderListResultListAddressCity fromDictionary:dict];
            self.orderLogOrder = [self objectOrNilForKey:kOrderListResultListOrderLogOrder fromDictionary:dict];
            self.commodityAttributes = [self objectOrNilForKey:kOrderListResultListCommodityAttributes fromDictionary:dict];
            self.commodityFreight = [[self objectOrNilForKey:kOrderListResultListCommodityFreight fromDictionary:dict] doubleValue];
            self.orderState = [[self objectOrNilForKey:kOrderListResultListOrderState fromDictionary:dict] doubleValue];
            self.baseUuid = [[self objectOrNilForKey:kOrderListResultListBaseUuid fromDictionary:dict] doubleValue];
            self.addressPhone = [self objectOrNilForKey:kOrderListResultListAddressPhone fromDictionary:dict];
            self.orderSerial = [[self objectOrNilForKey:kOrderListResultListOrderSerial fromDictionary:dict] doubleValue];
            self.categorySerial = [[self objectOrNilForKey:kOrderListResultListCategorySerial fromDictionary:dict] doubleValue];
            self.orderId = [[self objectOrNilForKey:kOrderListResultListOrderId fromDictionary:dict] doubleValue];
            self.orderAmount = [[self objectOrNilForKey:kOrderListResultListOrderAmount fromDictionary:dict] doubleValue];
            self.resultListIdentifier = [[self objectOrNilForKey:kOrderListResultListId fromDictionary:dict] doubleValue];
            self.addressAddress = [self objectOrNilForKey:kOrderListResultListAddressAddress fromDictionary:dict];
            self.orderLogCompany = [self objectOrNilForKey:kOrderListResultListOrderLogCompany fromDictionary:dict];
            self.brandSerial = [[self objectOrNilForKey:kOrderListResultListBrandSerial fromDictionary:dict] doubleValue];
            self.orderFreight = [[self objectOrNilForKey:kOrderListResultListOrderFreight fromDictionary:dict] doubleValue];
            self.addressName = [self objectOrNilForKey:kOrderListResultListAddressName fromDictionary:dict];
            self.commoditySellprice = [[self objectOrNilForKey:kOrderListResultListCommoditySellprice fromDictionary:dict] doubleValue];
            self.addressCountry = [self objectOrNilForKey:kOrderListResultListAddressCountry fromDictionary:dict];
            self.commoditySerial = [[self objectOrNilForKey:kOrderListResultListCommoditySerial fromDictionary:dict] doubleValue];
    NSObject *receivedOrderListCommodity = [dict objectForKey:kOrderListResultListCommodity];
    NSMutableArray *parsedOrderListCommodity = [NSMutableArray array];
    
    if ([receivedOrderListCommodity isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOrderListCommodity) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOrderListCommodity addObject:[OrderListCommodity modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOrderListCommodity isKindOfClass:[NSDictionary class]]) {
       [parsedOrderListCommodity addObject:[OrderListCommodity modelObjectWithDictionary:(NSDictionary *)receivedOrderListCommodity]];
    }

    self.commodity = [NSArray arrayWithArray:parsedOrderListCommodity];
            self.commodityName = [self objectOrNilForKey:kOrderListResultListCommodityName fromDictionary:dict];
            self.orderTime = [self objectOrNilForKey:kOrderListResultListOrderTime fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderPayment] forKey:kOrderListResultListOrderPayment];
    [mutableDict setValue:self.addressZipcode forKey:kOrderListResultListAddressZipcode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityQuantity] forKey:kOrderListResultListCommodityQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerialOrder] forKey:kOrderListResultListOrderSerialOrder];
    [mutableDict setValue:self.addressArea forKey:kOrderListResultListAddressArea];
    [mutableDict setValue:self.addressProvince forKey:kOrderListResultListAddressProvince];
    [mutableDict setValue:self.addressCity forKey:kOrderListResultListAddressCity];
    [mutableDict setValue:self.orderLogOrder forKey:kOrderListResultListOrderLogOrder];
    [mutableDict setValue:self.commodityAttributes forKey:kOrderListResultListCommodityAttributes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commodityFreight] forKey:kOrderListResultListCommodityFreight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderState] forKey:kOrderListResultListOrderState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseUuid] forKey:kOrderListResultListBaseUuid];
    [mutableDict setValue:self.addressPhone forKey:kOrderListResultListAddressPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderSerial] forKey:kOrderListResultListOrderSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categorySerial] forKey:kOrderListResultListCategorySerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderId] forKey:kOrderListResultListOrderId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderAmount] forKey:kOrderListResultListOrderAmount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultListIdentifier] forKey:kOrderListResultListId];
    [mutableDict setValue:self.addressAddress forKey:kOrderListResultListAddressAddress];
    [mutableDict setValue:self.orderLogCompany forKey:kOrderListResultListOrderLogCompany];
    [mutableDict setValue:[NSNumber numberWithDouble:self.brandSerial] forKey:kOrderListResultListBrandSerial];
    [mutableDict setValue:[NSNumber numberWithDouble:self.orderFreight] forKey:kOrderListResultListOrderFreight];
    [mutableDict setValue:self.addressName forKey:kOrderListResultListAddressName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySellprice] forKey:kOrderListResultListCommoditySellprice];
    [mutableDict setValue:self.addressCountry forKey:kOrderListResultListAddressCountry];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commoditySerial] forKey:kOrderListResultListCommoditySerial];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCommodity] forKey:kOrderListResultListCommodity];
    [mutableDict setValue:self.commodityName forKey:kOrderListResultListCommodityName];
    [mutableDict setValue:self.orderTime forKey:kOrderListResultListOrderTime];

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

    self.orderPayment = [aDecoder decodeDoubleForKey:kOrderListResultListOrderPayment];
    self.addressZipcode = [aDecoder decodeObjectForKey:kOrderListResultListAddressZipcode];
    self.commodityQuantity = [aDecoder decodeDoubleForKey:kOrderListResultListCommodityQuantity];
    self.orderSerialOrder = [aDecoder decodeDoubleForKey:kOrderListResultListOrderSerialOrder];
    self.addressArea = [aDecoder decodeObjectForKey:kOrderListResultListAddressArea];
    self.addressProvince = [aDecoder decodeObjectForKey:kOrderListResultListAddressProvince];
    self.addressCity = [aDecoder decodeObjectForKey:kOrderListResultListAddressCity];
    self.orderLogOrder = [aDecoder decodeObjectForKey:kOrderListResultListOrderLogOrder];
    self.commodityAttributes = [aDecoder decodeObjectForKey:kOrderListResultListCommodityAttributes];
    self.commodityFreight = [aDecoder decodeDoubleForKey:kOrderListResultListCommodityFreight];
    self.orderState = [aDecoder decodeDoubleForKey:kOrderListResultListOrderState];
    self.baseUuid = [aDecoder decodeDoubleForKey:kOrderListResultListBaseUuid];
    self.addressPhone = [aDecoder decodeObjectForKey:kOrderListResultListAddressPhone];
    self.orderSerial = [aDecoder decodeDoubleForKey:kOrderListResultListOrderSerial];
    self.categorySerial = [aDecoder decodeDoubleForKey:kOrderListResultListCategorySerial];
    self.orderId = [aDecoder decodeDoubleForKey:kOrderListResultListOrderId];
    self.orderAmount = [aDecoder decodeDoubleForKey:kOrderListResultListOrderAmount];
    self.resultListIdentifier = [aDecoder decodeDoubleForKey:kOrderListResultListId];
    self.addressAddress = [aDecoder decodeObjectForKey:kOrderListResultListAddressAddress];
    self.orderLogCompany = [aDecoder decodeObjectForKey:kOrderListResultListOrderLogCompany];
    self.brandSerial = [aDecoder decodeDoubleForKey:kOrderListResultListBrandSerial];
    self.orderFreight = [aDecoder decodeDoubleForKey:kOrderListResultListOrderFreight];
    self.addressName = [aDecoder decodeObjectForKey:kOrderListResultListAddressName];
    self.commoditySellprice = [aDecoder decodeDoubleForKey:kOrderListResultListCommoditySellprice];
    self.addressCountry = [aDecoder decodeObjectForKey:kOrderListResultListAddressCountry];
    self.commoditySerial = [aDecoder decodeDoubleForKey:kOrderListResultListCommoditySerial];
    self.commodity = [aDecoder decodeObjectForKey:kOrderListResultListCommodity];
    self.commodityName = [aDecoder decodeObjectForKey:kOrderListResultListCommodityName];
    self.orderTime = [aDecoder decodeObjectForKey:kOrderListResultListOrderTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_orderPayment forKey:kOrderListResultListOrderPayment];
    [aCoder encodeObject:_addressZipcode forKey:kOrderListResultListAddressZipcode];
    [aCoder encodeDouble:_commodityQuantity forKey:kOrderListResultListCommodityQuantity];
    [aCoder encodeDouble:_orderSerialOrder forKey:kOrderListResultListOrderSerialOrder];
    [aCoder encodeObject:_addressArea forKey:kOrderListResultListAddressArea];
    [aCoder encodeObject:_addressProvince forKey:kOrderListResultListAddressProvince];
    [aCoder encodeObject:_addressCity forKey:kOrderListResultListAddressCity];
    [aCoder encodeObject:_orderLogOrder forKey:kOrderListResultListOrderLogOrder];
    [aCoder encodeObject:_commodityAttributes forKey:kOrderListResultListCommodityAttributes];
    [aCoder encodeDouble:_commodityFreight forKey:kOrderListResultListCommodityFreight];
    [aCoder encodeDouble:_orderState forKey:kOrderListResultListOrderState];
    [aCoder encodeDouble:_baseUuid forKey:kOrderListResultListBaseUuid];
    [aCoder encodeObject:_addressPhone forKey:kOrderListResultListAddressPhone];
    [aCoder encodeDouble:_orderSerial forKey:kOrderListResultListOrderSerial];
    [aCoder encodeDouble:_categorySerial forKey:kOrderListResultListCategorySerial];
    [aCoder encodeDouble:_orderId forKey:kOrderListResultListOrderId];
    [aCoder encodeDouble:_orderAmount forKey:kOrderListResultListOrderAmount];
    [aCoder encodeDouble:_resultListIdentifier forKey:kOrderListResultListId];
    [aCoder encodeObject:_addressAddress forKey:kOrderListResultListAddressAddress];
    [aCoder encodeObject:_orderLogCompany forKey:kOrderListResultListOrderLogCompany];
    [aCoder encodeDouble:_brandSerial forKey:kOrderListResultListBrandSerial];
    [aCoder encodeDouble:_orderFreight forKey:kOrderListResultListOrderFreight];
    [aCoder encodeObject:_addressName forKey:kOrderListResultListAddressName];
    [aCoder encodeDouble:_commoditySellprice forKey:kOrderListResultListCommoditySellprice];
    [aCoder encodeObject:_addressCountry forKey:kOrderListResultListAddressCountry];
    [aCoder encodeDouble:_commoditySerial forKey:kOrderListResultListCommoditySerial];
    [aCoder encodeObject:_commodity forKey:kOrderListResultListCommodity];
    [aCoder encodeObject:_commodityName forKey:kOrderListResultListCommodityName];
    [aCoder encodeObject:_orderTime forKey:kOrderListResultListOrderTime];
}

- (id)copyWithZone:(NSZone *)zone {
    OrderListResultList *copy = [[OrderListResultList alloc] init];
    
    
    
    if (copy) {

        copy.orderPayment = self.orderPayment;
        copy.addressZipcode = [self.addressZipcode copyWithZone:zone];
        copy.commodityQuantity = self.commodityQuantity;
        copy.orderSerialOrder = self.orderSerialOrder;
        copy.addressArea = [self.addressArea copyWithZone:zone];
        copy.addressProvince = [self.addressProvince copyWithZone:zone];
        copy.addressCity = [self.addressCity copyWithZone:zone];
        copy.orderLogOrder = [self.orderLogOrder copyWithZone:zone];
        copy.commodityAttributes = [self.commodityAttributes copyWithZone:zone];
        copy.commodityFreight = self.commodityFreight;
        copy.orderState = self.orderState;
        copy.baseUuid = self.baseUuid;
        copy.addressPhone = [self.addressPhone copyWithZone:zone];
        copy.orderSerial = self.orderSerial;
        copy.categorySerial = self.categorySerial;
        copy.orderId = self.orderId;
        copy.orderAmount = self.orderAmount;
        copy.resultListIdentifier = self.resultListIdentifier;
        copy.addressAddress = [self.addressAddress copyWithZone:zone];
        copy.orderLogCompany = [self.orderLogCompany copyWithZone:zone];
        copy.brandSerial = self.brandSerial;
        copy.orderFreight = self.orderFreight;
        copy.addressName = [self.addressName copyWithZone:zone];
        copy.commoditySellprice = self.commoditySellprice;
        copy.addressCountry = [self.addressCountry copyWithZone:zone];
        copy.commoditySerial = self.commoditySerial;
        copy.commodity = [self.commodity copyWithZone:zone];
        copy.commodityName = [self.commodityName copyWithZone:zone];
        copy.orderTime = self.orderTime;
    }
    
    return copy;
}


@end
