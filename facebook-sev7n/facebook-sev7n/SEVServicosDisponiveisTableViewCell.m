//
//  SEVServicosDisponiveisTableViewCell.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 31/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVServicosDisponiveisTableViewCell.h"

@implementation SEVServicosDisponiveisTableViewCell

- (void)awakeFromNib
{
    self.viewCell.layer.borderColor = [UIColor colorWithRed:1 green:0.831 blue:0.29 alpha:1].CGColor;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    
}

@end
