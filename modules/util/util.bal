import ballerina/io;

// オープンレコード
type Persion record {
    string name;
};

// オープン制を制御してクローズ化する
type Person2 record {|
    string name;
|};

type TestRecord record {|
    string first;
    string second;
    string third;
|};

type Employee record {|
    readonly string name;
    int salary;
|};

public function demoType() {
    // プレーンデータ定義
    // anyのサブタイプ
    anydata data1 = [1, "string", true];
    // クローンも作れる
    anydata _ = data1.clone();

    // オープンレコード
    // デフォルトでオープンレコードとして生成され指定した型以上のキーを追加できる
    // build時に弾かれる
    Persion _ = {
        name: "user1"
        // age: 12
    };

    // クローズレコード
    // 追加で指定できない
    Person2 _ = {
        name: "user2"
        // age: 1
    };

    int[] nums = [1, 2, 3, 4];

    // SQLに似た内包表記
    int[] numsTimes10 = from var i in nums
        select i * 10;
    int[] evenNums = from var i in nums
        where i % 2 == 0
        select i;

    io:println(numsTimes10);
    io:println(evenNums);

    // レコード構造から抽出する
    // その他いろいろなクエリを使用してデータ操作可能
    // Query(for、let、where、order by、return)
    TestRecord test = {
        first: "1",
        second: "2",
        third: "3"
    };

    TestRecord[] tests = [test];

    var pickRecord = from var {first, second} in tests
        select {first, second};

    io:println(pickRecord);

    // テーブルタイプ
    // keyへの引数を複数指定するとマルチパートキーを指定することも可能
    // クエリからテーブルデータを生成も可能
    // JOIN区も使用できる
    table<Employee> key(name) t = table [
        {name: "yuya1", salary: 100},
        {name: "yuya2", salary: 200},
        {name: "yuya3", salary: 300},
        {name: "yuya4", salary: 400}

    ];

    io:println(t);
    io:println(t["yuya3"]);

    // バックティックサポート
    string userName = "Tester";
    io:println(`TestUser ${userName}`);
};
