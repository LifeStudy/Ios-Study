//
//  ViewController.m
//  AppObj
//
//  Created by bruno araujo on 08/03/22.
//

#import "ViewController.h"
#import "Course.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray<Course *> *courses;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchCoursesUsingJSON];

    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    
    [self.view addSubview:self.myTableView];
}

- (void)fetchCoursesUsingJSON {
    NSLog(@"Fetching Courses");
//
    NSString *urlString = @"https://api.letsbuildthatapp.com/jsondecodable/courses";
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"Finished fetching courses....");
        
        NSError *err;
        NSArray *courseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        if (err){
            NSLog(@"Failed to serialize into JSON: %@", err);
            return;
        }
        
        NSMutableArray<Course *> *courses = NSMutableArray.new;
        for (NSDictionary *courseDict in courseJSON) {
            NSString *name = courseDict[@"name"];
            NSNumber *numberOfLessons = courseDict[@"number_of_lessons"];
            Course *course = Course.new;
            course.name = name;
            course.numberOfLessons = numberOfLessons;
            [courses addObject:course];
        }
        
        NSLog(@"%@", courseJSON);
        self.courses = courses;
        
       dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTableView reloadData];
        });
        
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    Course *course = self.courses[indexPath.row];

    cell.textLabel.text = course.name;
    
    return cell;
}

- (void)tableView:(UITableView *)tablView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
