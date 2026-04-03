:- use_module(library(clpfd)).

solve(ZebraOwner, WaterDrinker) :-
    % Khai báo các biến
    Colors = [Red, Green, Ivory, Yellow, Blue],
    Nationalities = [Brit, Spaniard, Ukrainian, Japanese, Norwegian],
    Drinks = [Coffee, Tea, Milk, OrangeJuice, Water],
    Tobacco = [OldGold, Kools, LuckyStrike, Parliaments, Chesterfields],
    Pets = [Dog, Snails, Fox, Horse, Zebra],
    
    Schedule = [Colors, Nationalities, Drinks, Tobacco, Pets],
    append(Schedule, Vars),
    Vars ins 1..5,

    % Các giá trị trong cùng một hạng mục phải khác nhau
    all_distinct(Colors),
    all_distinct(Nationalities),
    all_distinct(Drinks),
    all_distinct(Tobacco),
    all_distinct(Pets),

    % Ràng buộc 
    Brit #= Red,                % Clue 1
    Spaniard #= Dog,            % Clue 2
    Coffee #= Green,            % Clue 3
    Ukrainian #= Tea,           % Clue 4
    Green #= Ivory + 1,         % Clue 5
    OldGold #= Snails,          % Clue 6
    Kools #= Yellow,            % Clue 7
    Milk #= 3,                  % Clue 8
    Norwegian #= 1,             % Clue 9
    abs(Chesterfields - Fox) #= 1,   % Clue 10
    abs(Kools - Horse) #= 1,         % Clue 11
    LuckyStrike #= OrangeJuice,      % Clue 12
    Japanese #= Parliaments,         % Clue 13
    abs(Norwegian - Blue) #= 1,      % Clue 14
    abs(Chesterfields - Water) #= 1, % Clue 15

    % Tìm kiếm 
    label(Vars),

    % Trả về tên quốc tịch 
    get_name(Zebra, Nationalities, ZebraOwner),
    get_name(Water, Nationalities, WaterDrinker).

% Hàm phụ trợ để lấy tên người
get_name(Pos, [Brit, _, _, _, _], 'Nguoi Anh (Brit)') :- Pos #= Brit.
get_name(Pos, [_, Spaniard, _, _, _], 'Nguoi Tay Ban Nha (Spaniard)') :- Pos #= Spaniard.
get_name(Pos, [_, _, Ukrainian, _, _], 'Nguoi Ukraine') :- Pos #= Ukrainian.
get_name(Pos, [_, _, _, Japanese, _], 'Nguoi Nhat (Japanese)') :- Pos #= Japanese.
get_name(Pos, [_, _, _, _, Norwegian], 'Nguoi Na Uy (Norwegian)') :- Pos #= Norwegian.