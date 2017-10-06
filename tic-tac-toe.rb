#呈現一個九宮格，並以陣列元素當作每一格位置
#兩位玩家進行遊戲
#透過遊戲總進行次數（輪數）判斷現在輪到玩家1 or 玩家2
#遊戲總進行次數（輪數 ）除以2餘1的為玩家1
#遊戲總進行次數（輪數 ）除以2餘0的為玩家2
#同一個位置只能一個玩家使用，不能重複，重複則重新要求輸入
#同符號連成一線時,該符號玩家Win
#9格都填滿時，和局

def display_3x3grid(board)

puts "\n"
puts "\n"
puts "#{board[0]} | #{board[1]} | #{board[2]}"
puts "---------------------"
puts "#{board[3]} | #{board[4]} | #{board[5]}"
puts "---------------------"
puts "#{board[6]} | #{board[7]} | #{board[8]}"
puts "\n"
puts "\n"

end

def judge(board, playtimes)

  if playtimes % 2 == 1 
    player = "玩家一"
  else
    player = "玩家二"
  end

  if board.count(" ") < 9 
    
    
  
  if board[0] == board[1] && board[0] == board[2] && board[0] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[0] == board[3] && board[0] == board[6] && board[0] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[0] == board[4] && board[0] == board[8] && board[0] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[3] == board[4] && board[3] == board[5] && board[3] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[2] == board[4] && board[2] == board[6] && board[2] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[1] == board[4] && board[1] == board[7] && board[1] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[6] == board[7] && board[6] == board[8] && board[6] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board[2] == board[5] && board[2] == board[8] && board[2] != " "
    puts player + " " + " 率先串成3點一線，成為 Winner"
    puts "\n"
    ask
  elsif board.index(" ") == nil
    puts "9格都被佔據了～～～ 和局"
    puts "\n"
    ask
  # else
      
  end

  end

end


def ask

  puts "遊戲結束！要繼續遊戲嗎？（Y/N）"

  replay = gets.chomp

  if replay == "Y" || replay == "y"
    body
  elsif replay == "N" || replay == "n" 
    puts "謝謝遊玩～ 掰掰！！！"
    exit true
  else
    while replay != "Y" || replay != "y" || replay != "N" || replay != "n"
      puts "遊戲結束！要繼續遊戲嗎？（Y/N）"
      replay = gets.chomp
      if replay == "Y" || replay == "y" 
        body
      elsif replay == "N" || replay == "n"
        puts "謝謝遊玩～ 掰掰！！！"
        exit true
      end
    end
  end
end

def body

playtimes = 1
board = [" "," "," "," "," "," "," "," "," "]
input(board,playtimes)

end


#####################################################

def input(board,playtimes)



  while board.index(" ") != nil 
    
    if playtimes % 2 == 1
      puts "第一順位，玩家1請輸入欲下的位置（0~8):"
      pos = gets.chomp.to_i
      
      if pos < 0 || pos > 8
        puts "請重新輸入"
        input(board,playtimes)
      elsif board[pos] != " "
        puts "位置重複，請重新輸入"
        input(board,playtimes)
      else
        board[pos] = "O"
        display_3x3grid(board)
        #判斷是否連線
        judge(board, playtimes)
        playtimes += 1
      end

    else

      puts "第二順位，玩家2請輸入欲下的位置（0~8):"
      pos = gets.chomp.to_i
      
      if pos < 0 || pos > 8
        puts "請重新輸入"
        input(board,playtimes)
      elsif board[pos] != " "
        puts "位置重複，請重新輸入"
        input(board,playtimes)
      else
        board[pos] = "X"
        display_3x3grid(board)
        #判斷是否連線
        judge(board, playtimes)
        playtimes += 1
      end

    end
    
  end

end



######################################################

puts "\n"
puts "Welcome to play Tic-Tac-Toe"
puts "\n"

puts "位置0 | 位置1 | 位置2"
puts "---------------------"
puts "位置3 | 位置4 | 位置5"
puts "---------------------"
puts "位置6 | 位置7 | 位置8"
puts "\n"

puts "順位一玩家以「O」符號表示指定的位置，順位二玩家以「X」符號代表指定的位置"
puts "\n"
puts "先連成一條線者獲勝！！ 加油～～開始遊戲囉！"

body




