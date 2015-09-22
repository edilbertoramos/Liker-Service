//
//  SEVServicosDisponiveisTableViewCell.h
//  facebook-sev7n
//
//  Created by Lúcio Barros on 31/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEVServicosDisponiveisTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelPrincipal;
@property (strong, nonatomic) IBOutlet UILabel *labelSecundario;
@property (weak, nonatomic) IBOutlet UIView *viewCell;

@end
