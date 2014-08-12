Translation Party Crawler
-------------

A web crawler specifically created to mine translations of large chunks of text from [TranslationParty](http://TranslationParty.com). I made it just for fun, so please don't use it for nefarious purposes.

### Requirements:
- Run `bundle install` in the project directory to install the required ruby gems.
- Install Firefox with the Selenium plugin.

### Usage:

```sh
ruby crawl.rb < input.txt
```

Results will be output to the terminal as well as files specified in the script

The constants you can tweak are as follows:
```ruby
# Time to wait to reach equilibrium or fail, in seconds
PROCESS_TIME_LIMIT = 30

# Regex to split up the input text into chunks
TEXT_DELIMITER_REGEX = /[\n\.]+[\s\.]*/

# Output file paths
OUT_FILE_PATH_LINE_TO_LINE = "line2line.txt"
OUT_FILE_PATH_ORIGINALS    = "originals.txt"
OUT_FILE_PATH_TRANSLATED   = "translated.txt"

TRANSLATION_PARTY_SITE_URL = 'http://translationparty.com'
```

### Example input and results:

#### INPUT

file `in.txt`

```text
I could stay awake just to hear you breathing
Watch you smile while you are sleeping
While you're far away and dreaming
I could spend my life in this sweet surrender
I could stay lost in this moment forever
Where every moment spent with you is a moment I treasure

Lying close to you feeling your heart beating
And I'm wondering what you're dreaming
Wondering if it's me you're seeing
Then I kiss your eyes and thank God we're together
I just wanna stay with you in this moment forever, forever and ever

I don't wanna miss one smile, I don't wanna miss one kiss
I just wanna be with you, right here with you, just like this
I just want to hold you close, feel your heart so close to mine
And just stay here in this moment for all the rest of time

Don't wanna close my eyes, don't wanna fall asleep
'Cause I'd miss you baby and I don't wanna miss a thing
'Cause even when I dream of you the sweetest dream would never do
I'd still miss you baby and I don't want to miss a thing

I don't wanna close my eyes, I don't wanna fall asleep
Yeah, I don't wanna miss a thing
```

#### OUTPUT

file `translated.txt`

```text
Woke up, heard the
Watch while you sleep, smile.
Far away in the dream
Could spend my life in this sweet surrender
Yet this moment forever lost if
Spent every moment of your treasures.
Feel your heart beat.
Dream I had
Wondered whether or not I have seen
Kiss your eyes and thank God we are together.
With you forever, forever at this point.
Miss Kiss Miss smile, not not have.
It is here the same rights.
Kept me very close to your heart.
Here is the remaining moments of all time.
Don't want to close my eyes and fall asleep.
Baby and I do not want to miss.
Sweet dream is your imagination.
Please, at least, Miss, Miss.
Close and Don ' t my eyes and fall asleep.
Yes, no, Miss.
```

file `line2line.txt`

```text
I could stay awake just to hear you breathing
>>> Woke up, heard the

Watch you smile while you are sleeping
>>> Watch while you sleep, smile.

While you're far away and dreaming
>>> Far away in the dream

I could spend my life in this sweet surrender
>>> Could spend my life in this sweet surrender

I could stay lost in this moment forever
>>> Yet this moment forever lost if

Where every moment spent with you is a moment I treasure
>>> Spent every moment of your treasures.

Lying close to you feeling your heart beating
>>> Feel your heart beat.

And I'm wondering what you're dreaming
>>> Dream I had

Wondering if it's me you're seeing
>>> Wondered whether or not I have seen

Then I kiss your eyes and thank God we're together
>>> Kiss your eyes and thank God we are together.

I just wanna stay with you in this moment forever, forever and ever
>>> With you forever, forever at this point.

I don't wanna miss one smile, I don't wanna miss one kiss
>>> Miss Kiss Miss smile, not not have.

I just wanna be with you, right here with you, just like this
>>> It is here the same rights.

I just want to hold you close, feel your heart so close to mine
>>> Kept me very close to your heart.

And just stay here in this moment for all the rest of time
>>> Here is the remaining moments of all time.

Don't wanna close my eyes, don't wanna fall asleep
>>> Don't want to close my eyes and fall asleep.

'Cause I'd miss you baby and I don't wanna miss a thing
>>> Baby and I do not want to miss.

'Cause even when I dream of you the sweetest dream would never do
>>> Sweet dream is your imagination.

I'd still miss you baby and I don't want to miss a thing
>>> Please, at least, Miss, Miss.

I don't wanna close my eyes, I don't wanna fall asleep
>>> Close and Don ' t my eyes and fall asleep.

Yeah, I don't wanna miss a thing
>>> Yes, no, Miss.
```

file `originals.txt`

```text
I could stay awake just to hear you breathing
Watch you smile while you are sleeping
While you're far away and dreaming
I could spend my life in this sweet surrender
I could stay lost in this moment forever
Where every moment spent with you is a moment I treasure
Lying close to you feeling your heart beating
And I'm wondering what you're dreaming
Wondering if it's me you're seeing
Then I kiss your eyes and thank God we're together
I just wanna stay with you in this moment forever, forever and ever
I don't wanna miss one smile, I don't wanna miss one kiss
I just wanna be with you, right here with you, just like this
I just want to hold you close, feel your heart so close to mine
And just stay here in this moment for all the rest of time
Don't wanna close my eyes, don't wanna fall asleep
'Cause I'd miss you baby and I don't wanna miss a thing
'Cause even when I dream of you the sweetest dream would never do
I'd still miss you baby and I don't want to miss a thing
I don't wanna close my eyes, I don't wanna fall asleep
Yeah, I don't wanna miss a thing
```

The MIT License (MIT)

Copyright (c) 2014 Chris Fritz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
