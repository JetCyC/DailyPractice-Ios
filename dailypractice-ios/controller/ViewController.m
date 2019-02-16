//
//  ViewController.m
//  UiTableView
//
//  Created by 曹延昌 on 2018/12/26.
//  Copyright © 2018年 曹延昌. All rights reserved.
//

#import "ViewController.h"
#import "CYGroup.h"
#import "CZCar.h"
#import "CZCarCell.h"
#import "CZCarFooterview.h"
#import "CZCarHeaderview.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,CZCarFooterViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *groups;
@end
@implementation ViewController

//懒加载
-(NSMutableArray *)groups{
    if (_groups==nil) {
        NSString *path=[[NSBundle mainBundle] pathForResource:@"car.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *arrayModels=[NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            CYGroup *model=[CYGroup groupWithDict:dict];
            [arrayModels addObject:model];
        }
        _groups=arrayModels;
    }
    
    return _groups;
    
}

/**
 1，设置源对象
 2，协议UITableViewDataSource
 3，协议的三个方法
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.tableView.rowHeight=60;
    //NSLog(@"viewDidLoad%@",@"viewDidLoad");
    
    CZCarFooterview *footerView=[CZCarFooterview footerView];
    
    
    footerView.delegate=self;
    self.tableView.tableFooterView=footerView;

    
    CZCarHeaderview *headerView=[CZCarHeaderview headerView];
    self.tableView.tableHeaderView=headerView;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.groups.count;
}

//一组多少个
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    CYGroup *group=self.groups[section];
    return group.cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1，获取模型数据
    CYGroup *group=self.groups[indexPath.section];
    CZCar *car=group.cars[indexPath.row];
    //2设置单元格
    //2.1声名一个重用id
    CZCarCell *cell=[CZCarCell carCellWithTableView:tableView];
    cell.czCars=car;//设置cell的值
    //4返回单元格
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CYGroup *group=self.groups[section];
    return group.title;
}

//设置右侧索引栏
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray *arrayIndex=[NSMutableArray array];
//    for (CYGroup *group in self.groups) {
//        [arrayIndex addObject:group.title];
//    }
    
    return [self.groups valueForKey:@"title"];
}

//监听被点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSLog(@"%ld",(long)indexPath.row);
   CYGroup *groups= self.groups[indexPath.section];
   CZCar *czcar=groups.cars[indexPath.row];
    
    UIAlertView *alertView=[[UIAlertView alloc]
                            initWithTitle:@"编辑英雄"
                            message:czcar.name
                            delegate:self
                            cancelButtonTitle:@"取消"
                            otherButtonTitles:@"确定",
                            nil];
    //设置分割
    alertView.alertViewStyle=UIAlertViewStylePlainTextInput;
    
    alertView.tag=indexPath.row;
    //
    [alertView textFieldAtIndex:0].text=czcar.name;
    
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){//确定
        //获取文本框中的内容
        NSString *name=[alertView textFieldAtIndex:0].text;
        //找到对应汽车模型
        CYGroup *groups=self.groups[0];
        CZCar *czcar=groups.cars[alertView.tag];
        //修改模型的name
        czcar.name=name;
        //刷新tablebview,局部刷新
        NSIndexPath *idex=[NSIndexPath indexPathForRow:alertView.tag inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[idex] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

//CZCarFooterview的代理方法
-(void)footerViewUpdateData:(CZCarFooterview *)footerView{
    CYGroup *groups=[[CYGroup alloc]init];
    groups.title=@"W";
    CZCar *czcar=[[CZCar alloc]init];
    czcar.icon=@"01";
    czcar.name=@"新加入的";
    NSMutableArray *carArray=[NSMutableArray array];
    [carArray addObject:czcar];
    groups.cars=carArray;
    [self.groups addObject:groups];//加入源数据
    [self.tableView reloadData];//刷新
}
@end
