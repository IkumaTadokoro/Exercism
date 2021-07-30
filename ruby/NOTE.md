# Exercismまとめ

## 文字列操作

### 文字列の一文字一文字を要素とする配列を作る

- [String\#chars \(Ruby 3\.0\.0 リファレンスマニュアル\)](https://docs.ruby-lang.org/ja/latest/method/String/i/chars.html)

```ruby
"12345".chars
#=> ["1", "2", "3", "4", "5"]
```

- [String\#each\_char \(Ruby 3\.0\.0 リファレンスマニュアル\)](https://docs.ruby-lang.org/ja/latest/method/String/i/each_char.html)
- [Array\#to\_a \(Ruby 3\.0\.0 リファレンスマニュアル\)](https://docs.ruby-lang.org/ja/latest/method/Array/i/to_a.html)
    - よく間違えるが、`Array#to_a`はStringをArrayにするものではない。ArrayのサブクラスならばArrayに変換する。

```ruby
"12345".each_char.to_a
#=> ["1", "2", "3", "4", "5"]
```


## 配列操作



### 重複ありで要素をn個ずつの配列にする

- [Enumerable\#each\_cons \(Ruby 2\.7\.0 リファレンスマニュアル\)](https://docs.ruby-lang.org/ja/2.7.0/method/Enumerable/i/each_cons.html)

> 要素を重複ありで n 要素ずつに区切り、ブロックに渡して繰り返します。
> ブロックを省略した場合は重複ありで n 要素ずつ繰り返す Enumerator を返します。

```ruby
"12345".chars.each_cons(2) { |v| p v }
#=> ["1", "2"]
#   ["2", "3"]
#   ["3", "4"]
#   ["4", "5"]
```

実例
- [series.rb](./series/series.rb)

### 重複なしで要素をn個ずつの配列にする

## ハッシュ

### ハッシュテーブルで省略記法

