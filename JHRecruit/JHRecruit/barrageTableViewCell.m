//
//  barrageTableViewCell.m
//  JHRecruit
//
//  Created by milan on 2017/8/2.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "barrageTableViewCell.h"

@implementation barrageTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLayout];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


-(void)setLayout{
    self.backgroundColor = [UIColor clearColor];
    
    self.rootView = [[MyRelativeLayout alloc]init];
    self.rootView.myHorzMargin = 0;
    self.rootView.wrapContentHeight = true;
    self.rootView.cacheEstimatedRect = true;
    self.rootView.padding = UIEdgeInsetsMake(5, 0, 5, 0);
    [self.contentView addSubview:self.rootView];
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    contentLayout.myHorzMargin = 0;
    contentLayout.wrapContentWidth = false;
    contentLayout.wrapContentHeight = true;
    contentLayout.layer.cornerRadius = 10;
    contentLayout.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    contentLayout.padding = UIEdgeInsetsMake(2, 5, 2, 5);
    [self.rootView addSubview:contentLayout];
    
    UILabel *label = [UILabel new];
    label.weight = 1;
    label.textColor = [UIColor whiteColor];
    label.wrapContentHeight = true;
    label.font = [JHTool font:14];
    label.adjustsFontSizeToFitWidth = true;
    [contentLayout addSubview:label];
    self.contentLabel = label;
}

-(void)setModel:(barrageModel *)model{
    
    NSString *str = [NSString stringWithFormat:@"%@:%@",model.uid,model.comment];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc]initWithString:str];
    
    NSRange range = [str rangeOfString:@":"];
    NSRange range1 = NSMakeRange(0, range.location);
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range1];
    
    self.contentLabel.attributedText = attrStr;
    [_contentLabel sizeToFit];
    

}

-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    return [self.rootView sizeThatFits:targetSize];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

  
}



@end
