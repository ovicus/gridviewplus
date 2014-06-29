/*

The MIT License (MIT)
http://opensource.org/licenses/MIT

Copyright (c) 2014 Lester Sánchez (lester@ovicus.com)

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

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EnhancedGridViewSample
{
    public static class DataSource
    {
        public static IEnumerable<Hotel> GetHotels()
        {
            Random rnd = new Random();

            for (int i = 1; i <= 30; i++)
            {
                yield return new Hotel
                             {
                                 Name = "Hotel" + i,
                                 Category = rnd.Next(1, 6),
                                 Price = rnd.Next(2, 10)*90,
                                 Location = "Location" + rnd.Next(1, 5),
                                 Phone = rnd.Next(101, 999) + "-" + rnd.Next(1001, 9999)
                             };
            }
        } 
    }

    public class Hotel
    {
        public string Name { get; set; }
        public int Category { get; set; }
        public decimal Price { get; set; }
        public string Location { get; set; }
        public string Phone { get; set; }
    }
}