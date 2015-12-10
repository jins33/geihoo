//
//  CommontEditViewController.m
//  GeihooGroups4IOS
//
//  Created by hjs on 15/10/23.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "CommontEditViewController.h"

@implementation CommontEditViewController{
    NSArray *societyTypes, *societyNames;
    /*
     *  data 所有数据
     *  topData 常用族族数据
     *  bottomData 其他数据
     */
    NSMutableArray *data, *topData, *bottomData;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initData];
    [self initView];
}

#pragma mark - UITableView 代理

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ([tableView isEqual:_topTableView]) {
        return @"常用";
    }else{
        return @"其他";
    }
}

//单元格返回的编辑风格，包括删除 添加 和 默认  和不可编辑三种风格
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_topTableView]) {
        return UITableViewCellEditingStyleDelete;
    }else{
        return UITableViewCellEditingStyleInsert;
    }
}
//返回YES，表示支持单元格的移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    if([tableView isEqual:_topTableView]){
        //需要的移动行
        NSInteger fromRow = [sourceIndexPath row];
        //获取移动某处的位置
        NSInteger toRow = [destinationIndexPath row];

        //从数组中读取需要移动行的数据
        id object = [topData objectAtIndex:fromRow];
        //在数组中移动需要移动的行的数据
        [topData removeObjectAtIndex:fromRow];
        //把需要移动的单元格数据在数组中，移动到想要移动的数据前面
        [topData insertObject:object atIndex:toRow];
    }else{
        //需要的移动行
        NSInteger fromRow = [sourceIndexPath row];
        //获取移动某处的位置
        NSInteger toRow = [destinationIndexPath row];

        //从数组中读取需要移动行的数据
        id object = [bottomData objectAtIndex:fromRow];
        //在数组中移动需要移动的行的数据
        [bottomData removeObjectAtIndex:fromRow];
        //把需要移动的单元格数据在数组中，移动到想要移动的数据前面
        [bottomData insertObject:object atIndex:toRow];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([tableView isEqual: _topTableView]) {
        return [topData count];
    } else {
        return [bottomData count];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([tableView isEqual: _topTableView]) {
        SocietyBean *societyBean = topData[indexPath.row];
        EditCommentTableViewCell *topCell = (EditCommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"editCell" forIndexPath:indexPath];
        topCell.iconImageView.originalImage = [UIImage imageNamed:societyBean.societyImage];
        [topCell.iconImageView initCircleImageView];
        topCell.nameLabel.text = societyBean.societyName;
        return topCell;
    }else{
        SocietyBean *societyBean = bottomData[indexPath.row];
        EditCommentTableViewCell *bottomCell = (EditCommentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"editCell" forIndexPath:indexPath];
        bottomCell.iconImageView.originalImage = [UIImage imageNamed:societyBean.societyImage];
        [bottomCell.iconImageView initCircleImageView];
        bottomCell.nameLabel.text = societyBean.societyName;
        return bottomCell;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获取选中删除行索引值
    NSInteger row = [indexPath row];
    if ([tableView isEqual:_topTableView] && editingStyle==UITableViewCellEditingStyleDelete) {
        //通过获取的索引值新增数组中的值
        [bottomData addObject:topData[row]];
        //通过获取的索引值删除数组中的值
        [topData removeObjectAtIndex:row];
        //删除单元格的某一行时，在用动画效果实现删除过程
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        //新增单元格的某一行时，在用动画效果实现删除过程
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:[bottomData count]-1 inSection:0];
        [_bottomTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }else if([tableView isEqual:_bottomTableView] && editingStyle==UITableViewCellEditingStyleInsert)
    {
        //通过获取的索引值新增数组中的值
        [topData addObject:bottomData[row]];
        //通过获取的索引值删除数组中的值
        [bottomData removeObjectAtIndex:row];
        //删除单元格的某一行时，在用动画效果实现删除过程
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        //新增单元格的某一行时，在用动画效果实现删除过程
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:[topData count]-1 inSection:0];
        [_topTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - 初始化数据、视图

-(void)initData{
    data = [NSMutableArray array];
    SocietyBean *societyBean;
    societyNames = @[@"大海诗社", @"萝莉控", @"小清新一族", @"赖床俱乐部", @"思考人生俱乐部", @"梦之族族", @"青春纪念册", @"动漫族族", @"We are a team", @"关爱小动物协会", @"疯狂一族", @"那些年"];
    for (int i = 0; i < 12; i++) {
        societyBean = [SocietyBean new];
        societyBean.societyImage = [NSString stringWithFormat:@"tx%d", i + 1];
        societyBean.societyName = societyNames[i];
        [data addObject:societyBean];
    }
    topData = [NSMutableArray arrayWithArray:@[data[0], data[1], data[2], data[3], data[4], data[5]]];
    bottomData = [NSMutableArray arrayWithArray:@[data[6], data[7], data[8], data[9], data[10], data[11]]];
}

-(void)initView{
    //注册tableViewCell
    UINib *cellNib = [UINib nibWithNibName:@"EditCommentTableViewCell" bundle:nil];
    [_topTableView registerNib:cellNib forCellReuseIdentifier:@"editCell"];
    [_bottomTableView registerNib:cellNib forCellReuseIdentifier:@"editCell"];
    [_topTableView setEditing:YES animated:YES];
    [_bottomTableView setEditing:YES animated:YES];
}

@end
