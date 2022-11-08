const Box = @import("../Box.zig");
const Tile = @import("../Tile.zig");
const Room = @import("../Room.zig");
const Stage = @import("../Stage.zig");

pub const needleman = Stage{
  .rooms = &[_]Room{
    Room{
      .width = 48,
      .height = 15,
      .bounds = Box{ .x = 0, .y = 0, .w = 768, .h = 240 },
      .data = &[_]u8{
        49, 50, 51, 52, 0, 0, 0, 0, 0, 4, 5, 5, 3, 0, 53, 51, 54, 55, 49, 50, 51, 52, 5, 5, 3, 0, 0, 0, 0, 0, 53, 51, 54, 55, 56, 56, 49, 50, 51, 52, 0, 4, 5, 5, 5, 5, 3, 2, 
        57, 50, 51, 52, 0, 0, 0, 0, 4, 5, 5, 5, 5, 3, 53, 51, 54, 58, 57, 50, 51, 52, 5, 5, 5, 3, 0, 0, 0, 0, 53, 51, 54, 58, 59, 59, 57, 50, 51, 52, 4, 5, 5, 5, 5, 5, 20, 2, 
        56, 60, 60, 61, 0, 14, 15, 16, 5, 5, 5, 5, 5, 5, 62, 60, 60, 60, 60, 60, 60, 61, 5, 5, 5, 5, 12, 13, 0, 14, 62, 60, 60, 60, 60, 60, 60, 61, 60, 61, 5, 5, 5, 5, 5, 5, 5, 2, 
        59, 60, 60, 61, 16, 5, 5, 5, 5, 5, 5, 5, 62, 60, 60, 60, 60, 60, 60, 60, 60, 61, 5, 5, 5, 5, 5, 5, 16, 5, 62, 60, 60, 60, 60, 60, 60, 61, 5, 5, 5, 5, 20, 21, 5, 5, 5, 2, 
        49, 50, 51, 52, 5, 5, 5, 5, 5, 5, 5, 5, 53, 51, 54, 55, 56, 56, 49, 50, 51, 52, 5, 5, 5, 5, 5, 5, 5, 5, 53, 51, 54, 55, 49, 50, 51, 52, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 
        57, 50, 51, 52, 5, 5, 5, 5, 20, 21, 5, 5, 53, 51, 54, 58, 59, 59, 57, 50, 51, 52, 5, 5, 5, 5, 5, 5, 5, 5, 53, 51, 54, 58, 57, 50, 51, 52, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 
        60, 60, 60, 61, 5, 5, 5, 5, 5, 5, 5, 5, 62, 60, 60, 60, 60, 60, 60, 60, 60, 61, 5, 5, 5, 5, 5, 5, 5, 5, 62, 60, 60, 60, 60, 60, 60, 61, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 
        60, 61, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 62, 60, 60, 61, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 62, 60, 60, 61, 5, 5, 5, 5, 63, 64, 63, 64, 5, 5, 5, 2, 
        60, 61, 65, 66, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 65, 66, 62, 60, 60, 61, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 65, 66, 62, 60, 60, 61, 5, 5, 65, 66, 67, 68, 69, 70, 5, 5, 5, 2, 
        60, 61, 71, 72, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 71, 72, 62, 60, 60, 61, 5, 5, 63, 64, 63, 64, 5, 5, 5, 5, 71, 72, 62, 60, 63, 64, 63, 64, 63, 64, 73, 70, 67, 74, 5, 5, 5, 2, 
        60, 61, 75, 76, 71, 66, 5, 5, 5, 5, 5, 5, 66, 5, 75, 76, 62, 60, 60, 61, 71, 66, 73, 70, 67, 74, 5, 5, 66, 5, 75, 76, 62, 60, 73, 70, 67, 68, 69, 70, 67, 68, 69, 70, 5, 5, 5, 2, 
        60, 61, 76, 75, 75, 72, 71, 5, 5, 5, 5, 5, 72, 71, 76, 75, 62, 60, 60, 61, 75, 72, 67, 68, 69, 70, 5, 5, 72, 71, 76, 75, 62, 60, 67, 68, 69, 70, 67, 68, 69, 70, 67, 74, 71, 5, 5, 2, 
        63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 63, 64, 73, 70, 67, 74, 63, 64, 63, 64, 63, 64, 63, 64, 73, 70, 67, 68, 69, 70, 67, 68, 69, 70, 63, 64, 37, 2, 
        69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 37, 2, 
        67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 69, 70, 67, 68, 37, 2, 
      },
    },
    Room{
      .width = 112,
      .height = 15,
      .bounds = Box{ .x = 512, .y = 240, .w = 1792, .h = 240 },
      .data = &[_]u8{
        77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 78, 79, 5, 2, 8, 9, 7, 2, 0, 0, 0, 4, 5, 80, 44, 5, 42, 43, 44, 5, 42, 43, 80, 0, 0, 0, 0, 0, 0, 0, 0, 4, 3, 0, 0, 4, 5, 80, 42, 43, 42, 43, 44, 5, 44, 5, 80, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 0, 0, 80, 42, 43, 42, 43, 44, 5, 44, 5, 44, 5, 80, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 0, 0, 2, 
        81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 82, 83, 5, 2, 7, 6, 8, 2, 0, 0, 4, 5, 5, 84, 42, 43, 44, 5, 42, 43, 42, 43, 84, 3, 0, 0, 0, 0, 0, 0, 4, 5, 5, 3, 4, 5, 5, 84, 42, 43, 44, 5, 42, 43, 42, 43, 84, 3, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 20, 21, 5, 5, 5, 3, 4, 84, 42, 43, 44, 5, 42, 43, 42, 43, 42, 43, 84, 3, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 2, 
        7, 2, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 2, 7, 6, 1, 2, 15, 16, 5, 5, 5, 80, 44, 5, 42, 43, 44, 5, 42, 43, 80, 5, 12, 13, 0, 14, 15, 16, 5, 5, 5, 5, 5, 5, 5, 80, 42, 43, 44, 5, 44, 5, 42, 43, 80, 5, 12, 13, 0, 14, 15, 16, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 80, 42, 43, 44, 5, 42, 43, 44, 5, 42, 43, 80, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 
        8, 2, 0, 0, 0, 0, 4, 5, 20, 21, 5, 5, 5, 5, 5, 2, 8, 1, 6, 2, 5, 5, 5, 5, 5, 84, 44, 5, 42, 43, 44, 5, 44, 5, 84, 5, 5, 5, 16, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 84, 44, 5, 42, 43, 44, 5, 42, 43, 84, 5, 5, 5, 16, 5, 5, 5, 5, 5, 20, 21, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 84, 44, 5, 42, 43, 42, 43, 44, 5, 42, 43, 84, 5, 5, 5, 5, 5, 5, 5, 20, 21, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 
        7, 2, 0, 14, 15, 16, 5, 5, 5, 5, 5, 5, 5, 5, 5, 22, 7, 6, 7, 83, 5, 5, 5, 5, 5, 80, 42, 43, 44, 5, 42, 43, 42, 43, 80, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 80, 42, 43, 44, 5, 42, 43, 44, 5, 80, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 80, 42, 43, 44, 5, 44, 5, 42, 43, 44, 5, 80, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 
        8, 2, 16, 5, 5, 5, 5, 5, 5, 5, 31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 34, 5, 5, 5, 84, 44, 5, 42, 43, 44, 5, 44, 5, 84, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 84, 42, 43, 44, 5, 44, 5, 5, 5, 84, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 85, 11, 11, 11, 11, 79, 5, 84, 42, 43, 44, 5, 5, 5, 44, 5, 5, 5, 84, 5, 5, 5, 5, 5, 20, 21, 5, 5, 5, 5, 5, 5, 85, 11, 11, 79, 37, 2, 
        7, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 86, 39, 47, 48, 39, 40, 47, 48, 39, 87, 5, 5, 5, 80, 5, 5, 44, 5, 5, 5, 44, 5, 80, 5, 5, 5, 5, 5, 5, 5, 5, 5, 88, 89, 5, 5, 5, 80, 44, 5, 44, 5, 5, 5, 5, 5, 84, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 39, 47, 48, 39, 2, 5, 80, 44, 5, 44, 5, 5, 5, 5, 5, 5, 5, 84, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 39, 40, 2, 90, 2, 
        8, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 91, 8, 7, 6, 45, 46, 7, 6, 8, 92, 5, 5, 5, 84, 5, 5, 5, 5, 5, 5, 44, 5, 84, 5, 5, 5, 5, 5, 5, 5, 5, 5, 93, 94, 5, 5, 5, 84, 44, 5, 5, 5, 5, 85, 95, 77, 77, 77, 77, 77, 78, 79, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 96, 45, 46, 6, 45, 2, 5, 84, 44, 5, 5, 5, 5, 85, 95, 77, 77, 77, 77, 77, 78, 79, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 96, 45, 46, 2, 90, 2, 
        7, 2, 5, 5, 5, 5, 31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 34, 88, 89, 5, 5, 5, 5, 80, 5, 5, 5, 88, 89, 5, 5, 5, 5, 97, 98, 5, 5, 5, 80, 5, 5, 99, 5, 5, 2, 100, 100, 100, 100, 100, 100, 100, 2, 5, 5, 5, 5, 5, 5, 85, 11, 11, 11, 23, 1, 7, 6, 9, 2, 5, 80, 5, 5, 99, 5, 5, 2, 100, 100, 100, 100, 100, 100, 100, 2, 5, 5, 5, 5, 5, 5, 85, 11, 11, 11, 23, 1, 7, 2, 90, 2, 
        8, 2, 5, 5, 20, 21, 5, 5, 86, 39, 39, 40, 47, 48, 39, 40, 47, 48, 39, 40, 47, 48, 39, 40, 47, 48, 39, 87, 93, 94, 5, 5, 5, 5, 84, 5, 5, 5, 93, 94, 5, 5, 85, 95, 78, 95, 78, 79, 5, 84, 5, 5, 5, 5, 5, 2, 100, 101, 102, 103, 104, 105, 100, 2, 5, 5, 5, 5, 5, 5, 2, 48, 39, 40, 39, 7, 8, 1, 6, 2, 5, 84, 5, 5, 5, 5, 5, 2, 100, 101, 102, 103, 104, 105, 100, 2, 5, 5, 5, 5, 5, 5, 2, 48, 39, 40, 39, 7, 8, 2, 90, 2, 
        7, 2, 5, 5, 5, 5, 5, 5, 91, 8, 45, 46, 7, 6, 45, 46, 7, 6, 45, 46, 7, 6, 45, 46, 7, 6, 8, 92, 97, 98, 5, 5, 5, 5, 80, 5, 5, 5, 97, 98, 5, 5, 22, 106, 82, 106, 82, 83, 5, 84, 5, 5, 5, 5, 5, 22, 100, 107, 108, 109, 110, 111, 100, 83, 5, 5, 5, 5, 5, 5, 96, 6, 45, 46, 7, 6, 7, 6, 9, 96, 5, 84, 5, 5, 5, 5, 5, 22, 100, 107, 108, 109, 110, 111, 100, 83, 5, 5, 5, 5, 5, 5, 96, 6, 45, 46, 7, 6, 9, 2, 90, 2, 
        8, 2, 31, 32, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 34, 7, 8, 1, 8, 1, 8, 1, 6, 31, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 34, 7, 8, 1, 8, 1, 6, 2, 90, 2, 
        7, 2, 5, 5, 5, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 48, 8, 8, 9, 1, 1, 7, 6, 1, 47, 48, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 48, 8, 8, 9, 1, 1, 7, 2, 90, 2, 
        8, 2, 5, 5, 5, 86, 39, 40, 39, 38, 40, 39, 47, 48, 39, 38, 40, 39, 39, 40, 39, 38, 40, 39, 39, 40, 39, 38, 40, 39, 39, 40, 39, 38, 40, 39, 39, 40, 39, 38, 40, 39, 39, 40, 39, 38, 40, 39, 47, 48, 39, 38, 40, 48, 47, 48, 39, 38, 40, 48, 47, 48, 39, 38, 40, 48, 47, 48, 47, 48, 7, 6, 7, 6, 7, 6, 8, 1, 7, 6, 7, 38, 40, 39, 47, 48, 47, 48, 39, 38, 40, 39, 39, 38, 40, 39, 47, 48, 39, 40, 47, 48, 7, 6, 7, 6, 7, 6, 8, 2, 90, 2, 
        7, 2, 5, 5, 5, 91, 7, 6, 8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 45, 46, 8, 9, 1, 1, 45, 46, 8, 9, 1, 1, 45, 46, 8, 9, 1, 1, 45, 46, 8, 9, 1, 1, 45, 46, 8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 7, 6, 8, 9, 7, 6, 45, 46, 8, 9, 8, 9, 7, 1, 8, 9, 1, 1, 45, 46, 45, 46, 8, 9, 1, 1, 8, 9, 1, 1, 45, 46, 45, 46, 8, 9, 7, 6, 45, 46, 8, 9, 9, 2, 90, 2, 
      },
    },
    Room{
      .width = 48,
      .height = 15,
      .bounds = Box{ .x = 2048, .y = 480, .w = 768, .h = 240 },
      .data = &[_]u8{
        7, 6, 7, 6, 45, 46, 45, 46, 8, 9, 7, 6, 6, 96, 112, 2, 7, 6, 7, 6, 7, 6, 8, 9, 8, 9, 8, 9, 8, 9, 1, 2, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 96, 90, 2, 6, 
        6, 10, 11, 11, 23, 1, 8, 1, 7, 6, 6, 10, 11, 23, 112, 2, 8, 1, 8, 1, 8, 1, 7, 6, 7, 6, 7, 6, 7, 6, 6, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 23, 90, 2, 1, 
        1, 2, 113, 113, 88, 89, 11, 11, 23, 46, 8, 2, 113, 113, 112, 2, 8, 9, 8, 9, 7, 6, 7, 6, 7, 6, 45, 46, 45, 46, 1, 2, 113, 114, 115, 113, 113, 113, 113, 114, 115, 113, 113, 113, 113, 90, 2, 8, 
        6, 2, 112, 112, 93, 94, 113, 113, 2, 1, 6, 96, 112, 112, 112, 2, 7, 6, 7, 6, 8, 1, 8, 1, 8, 1, 8, 1, 8, 1, 6, 2, 112, 116, 117, 112, 112, 112, 112, 116, 117, 112, 112, 112, 112, 90, 2, 7, 
        1, 2, 112, 112, 97, 98, 112, 112, 10, 11, 11, 23, 112, 112, 112, 2, 45, 46, 45, 46, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 6, 96, 112, 118, 119, 112, 112, 112, 112, 118, 119, 112, 112, 112, 112, 112, 2, 45, 
        6, 2, 112, 112, 113, 113, 112, 112, 113, 113, 113, 113, 112, 112, 112, 10, 8, 1, 8, 1, 8, 1, 6, 10, 11, 11, 11, 11, 11, 11, 11, 23, 112, 116, 117, 112, 112, 112, 112, 116, 117, 112, 112, 112, 112, 112, 2, 8, 
        1, 2, 90, 88, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 77, 89, 46, 7, 6, 45, 46, 1, 2, 113, 113, 113, 113, 114, 115, 113, 113, 112, 118, 119, 112, 112, 112, 112, 118, 31, 34, 112, 112, 112, 112, 2, 6, 
        6, 2, 90, 97, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 81, 98, 11, 11, 11, 23, 1, 6, 2, 112, 112, 112, 112, 116, 117, 112, 112, 112, 116, 117, 112, 112, 112, 112, 116, 115, 113, 112, 112, 112, 112, 2, 1, 
        1, 2, 90, 113, 113, 113, 113, 113, 113, 113, 10, 11, 11, 11, 11, 11, 23, 113, 113, 113, 10, 11, 11, 23, 112, 112, 112, 112, 118, 119, 112, 112, 112, 118, 119, 112, 31, 34, 112, 118, 119, 112, 112, 112, 31, 34, 2, 6, 
        6, 2, 90, 112, 112, 112, 112, 112, 112, 112, 88, 77, 77, 77, 89, 113, 113, 112, 112, 112, 114, 115, 113, 113, 112, 112, 120, 31, 32, 33, 32, 33, 32, 34, 117, 112, 113, 113, 112, 116, 117, 112, 112, 112, 113, 113, 2, 1, 
        8, 2, 112, 112, 112, 112, 112, 112, 112, 112, 97, 81, 81, 81, 98, 112, 112, 112, 112, 112, 118, 119, 112, 112, 112, 112, 2, 36, 35, 36, 35, 36, 35, 2, 119, 112, 112, 112, 112, 118, 119, 112, 112, 112, 112, 112, 2, 8, 
        6, 96, 112, 112, 112, 112, 112, 112, 112, 112, 113, 113, 113, 113, 113, 112, 112, 112, 112, 112, 116, 117, 112, 112, 112, 112, 96, 40, 39, 40, 39, 40, 39, 2, 117, 112, 112, 112, 112, 116, 117, 112, 112, 112, 112, 112, 2, 7, 
        32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 34, 7, 7, 6, 7, 6, 7, 2, 119, 121, 112, 112, 122, 118, 119, 121, 122, 123, 121, 123, 2, 45, 
        35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 40, 8, 8, 1, 8, 1, 8, 2, 124, 100, 123, 123, 100, 125, 124, 100, 100, 100, 100, 100, 2, 8, 
        39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 39, 40, 8, 9, 45, 46, 8, 9, 1, 2, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 100, 2, 6, 
      },
    },
    Room{
      .width = 16,
      .height = 15,
      .bounds = Box{ .x = 2560, .y = 240, .w = 256, .h = 240 },
      .data = &[_]u8{
        1, 2, 37, 5, 5, 5, 42, 43, 42, 43, 42, 43, 42, 43, 2, 6, 
        6, 2, 37, 5, 5, 5, 44, 5, 42, 43, 42, 43, 44, 5, 2, 1, 
        1, 2, 37, 5, 5, 5, 44, 5, 42, 43, 44, 5, 5, 5, 2, 8, 
        6, 2, 37, 5, 5, 5, 5, 5, 44, 5, 44, 5, 31, 32, 2, 7, 
        1, 2, 20, 21, 5, 5, 5, 5, 44, 5, 5, 5, 5, 5, 2, 45, 
        6, 2, 5, 5, 20, 21, 5, 5, 5, 5, 31, 32, 5, 5, 2, 8, 
        1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 6, 
        6, 96, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 1, 
        32, 33, 32, 33, 32, 33, 32, 33, 32, 34, 5, 5, 5, 5, 2, 6, 
        35, 36, 35, 36, 35, 36, 35, 36, 35, 2, 5, 5, 5, 5, 2, 1, 
        47, 48, 39, 38, 39, 40, 47, 48, 39, 2, 5, 5, 5, 5, 2, 8, 
        45, 46, 8, 9, 8, 1, 45, 46, 8, 31, 32, 32, 34, 90, 2, 7, 
        7, 6, 7, 6, 8, 9, 1, 1, 1, 48, 39, 40, 2, 90, 2, 45, 
        8, 1, 8, 1, 7, 6, 7, 6, 45, 46, 8, 1, 2, 90, 2, 8, 
        8, 9, 1, 1, 45, 46, 8, 9, 45, 46, 7, 6, 2, 90, 2, 6, 
      },
    },
    Room{
      .width = 16,
      .height = 15,
      .bounds = Box{ .x = 2560, .y = 0, .w = 256, .h = 240 },
      .data = &[_]u8{
        1, 2, 37, 5, 5, 5, 42, 43, 42, 43, 44, 5, 42, 43, 2, 6, 
        6, 2, 37, 5, 5, 5, 44, 5, 44, 5, 42, 43, 42, 43, 2, 1, 
        1, 2, 5, 5, 5, 5, 44, 5, 5, 5, 44, 5, 44, 5, 2, 8, 
        6, 2, 5, 5, 5, 5, 5, 5, 5, 5, 44, 5, 5, 5, 2, 7, 
        1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 45, 
        6, 2, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 34, 37, 2, 8, 
        1, 2, 42, 43, 42, 43, 44, 5, 5, 5, 42, 43, 42, 37, 2, 6, 
        6, 2, 44, 5, 42, 43, 44, 5, 5, 5, 44, 5, 5, 37, 2, 1, 
        1, 2, 5, 5, 44, 5, 44, 5, 5, 5, 5, 5, 5, 5, 2, 6, 
        6, 2, 5, 5, 5, 5, 44, 5, 5, 5, 5, 5, 5, 5, 2, 1, 
        1, 2, 37, 31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 2, 8, 
        6, 2, 37, 5, 42, 43, 44, 5, 42, 43, 42, 43, 44, 5, 2, 7, 
        1, 2, 37, 5, 42, 43, 42, 43, 42, 43, 44, 5, 42, 43, 2, 45, 
        6, 2, 37, 5, 42, 43, 44, 5, 42, 43, 44, 5, 44, 5, 2, 8, 
        1, 2, 37, 5, 42, 43, 42, 43, 42, 43, 42, 43, 42, 43, 2, 6, 
      },
    },
    Room{
      .width = 32,
      .height = 15,
      .bounds = Box{ .x = 2560, .y = -240, .w = 512, .h = 240 },
      .data = &[_]u8{
        1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 2, 6, 7, 6, 8, 9, 1, 1, 7, 6, 7, 6, 8, 9, 
        6, 2, 5, 3, 0, 0, 0, 0, 0, 0, 4, 5, 5, 5, 5, 5, 5, 5, 2, 1, 8, 1, 7, 6, 7, 6, 8, 1, 8, 1, 7, 6, 
        1, 2, 5, 5, 12, 13, 0, 14, 15, 16, 5, 5, 5, 5, 5, 5, 5, 5, 2, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 
        6, 2, 5, 5, 5, 5, 16, 5, 5, 5, 5, 5, 20, 21, 5, 5, 5, 5, 22, 11, 11, 11, 11, 11, 11, 11, 23, 1, 8, 1, 8, 1, 
        1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 6, 7, 6, 7, 6, 
        6, 2, 5, 5, 5, 5, 20, 21, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 20, 21, 5, 5, 22, 11, 11, 11, 11, 11, 
        1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
        6, 2, 5, 5, 5, 5, 5, 5, 20, 21, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
        1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 31, 32, 32, 33, 32, 33, 32, 33, 32, 34, 5, 5, 5, 5, 5, 5, 5, 5, 
        6, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 35, 35, 36, 35, 36, 35, 36, 35, 2, 5, 5, 5, 5, 5, 5, 5, 5, 
        1, 2, 37, 31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 2, 38, 39, 38, 39, 40, 39, 38, 39, 31, 32, 33, 32, 33, 32, 33, 32, 33, 
        6, 2, 37, 5, 42, 43, 44, 5, 42, 43, 42, 43, 44, 5, 2, 6, 8, 9, 7, 6, 8, 9, 45, 39, 40, 36, 35, 36, 35, 36, 35, 36, 
        1, 2, 37, 5, 42, 43, 42, 43, 42, 43, 44, 5, 42, 43, 2, 6, 7, 6, 45, 46, 7, 6, 7, 6, 1, 39, 39, 38, 39, 40, 47, 48, 
        6, 2, 37, 5, 42, 43, 44, 5, 42, 43, 44, 5, 42, 43, 2, 1, 8, 1, 8, 1, 8, 1, 8, 1, 7, 6, 8, 9, 8, 1, 45, 46, 
        1, 2, 37, 5, 42, 43, 42, 43, 42, 43, 42, 43, 42, 43, 2, 8, 1, 1, 8, 9, 1, 1, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 
      },
      .door2_y = 6,
    },
    Room{
      .width = 16,
      .height = 15,
      .bounds = Box{ .x = 3072, .y = -240, .w = 256, .h = 240 },
      .data = &[_]u8{
        1, 1, 7, 6, 8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 7, 6, 
        7, 6, 8, 1, 7, 6, 7, 6, 8, 1, 7, 6, 7, 6, 8, 1, 
        8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 7, 6, 8, 9, 1, 1, 
        7, 6, 7, 6, 8, 1, 7, 6, 7, 6, 8, 1, 7, 6, 7, 6, 
        7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
        17, 17, 18, 19, 17, 17, 17, 17, 18, 19, 17, 17, 17, 17, 17, 17, 
        24, 24, 25, 26, 24, 24, 24, 24, 25, 26, 24, 24, 24, 24, 24, 24, 
        24, 24, 28, 29, 24, 24, 24, 24, 28, 29, 24, 24, 24, 24, 24, 24, 
        24, 24, 25, 26, 24, 24, 24, 24, 25, 26, 24, 24, 24, 24, 24, 24, 
        41, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 
        35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 35, 36, 
        47, 48, 39, 38, 40, 39, 39, 38, 40, 39, 47, 48, 39, 40, 47, 48, 
        45, 46, 8, 9, 1, 1, 8, 9, 1, 1, 45, 46, 45, 46, 8, 9, 
        7, 6, 8, 9, 1, 1, 7, 6, 7, 6, 8, 9, 1, 1, 7, 6, 
      },
      .door2_y = 6,
      .door1_y = 6,
    },
    Room{
      .width = 16,
      .height = 15,
      .bounds = Box{ .x = 3328, .y = -240, .w = 256, .h = 240 },
      .data = &[_]u8{
        7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 7, 6, 
        10, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 
        2, 17, 17, 17, 18, 19, 17, 17, 17, 17, 18, 19, 17, 17, 17, 2, 
        2, 24, 24, 24, 25, 26, 24, 24, 24, 24, 25, 26, 24, 24, 24, 2, 
        2, 27, 27, 27, 28, 29, 27, 27, 27, 27, 28, 29, 24, 24, 24, 2, 
        23, 17, 17, 17, 25, 26, 17, 17, 17, 17, 25, 26, 24, 24, 24, 2, 
        17, 24, 24, 24, 28, 29, 27, 27, 27, 27, 28, 29, 27, 27, 27, 2, 
        24, 24, 24, 24, 25, 26, 17, 17, 17, 17, 25, 26, 17, 17, 17, 2, 
        24, 24, 24, 24, 28, 29, 24, 24, 24, 24, 28, 29, 27, 27, 27, 2, 
        24, 24, 24, 24, 25, 26, 24, 24, 24, 24, 25, 26, 17, 17, 17, 2, 
        34, 27, 27, 27, 28, 29, 27, 27, 27, 27, 28, 29, 24, 24, 24, 2, 
        2, 17, 17, 17, 25, 26, 17, 17, 17, 17, 25, 26, 24, 24, 24, 2, 
        2, 27, 27, 27, 28, 29, 24, 24, 24, 24, 28, 29, 27, 27, 27, 2, 
        2, 17, 17, 17, 25, 26, 24, 24, 24, 24, 25, 26, 17, 17, 17, 2, 
        31, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 33, 32, 34, 
      },
      .door1_y = 6,
    },
  },
  .attribs = &[_]Tile.Attrib{
    .none, .none, .solid, .none, .none, .none, .none, .none, .none, .none, .solid, .solid, .none, .none, .none, .none, 
    .none, .none, .none, .none, .none, .none, .solid, .solid, .none, .none, .none, .none, .none, .none, .solid, .solid, 
    .solid, .solid, .solid, .none, .solid, .ladder, .none, .none, .none, .solid, .none, .none, .none, .none, .none, .none, 
    .none, .none, .none, .none, .none, .none, .none, .none, .none, .none, .none, .none, .none, .none, .none, .solid, 
    .solid, .none, .none, .solid, .solid, .solid, .solid, .none, .none, .solid, .solid, .none, .none, .solid, .solid, .solid, 
    .none, .solid, .solid, .solid, .none, .solid, .none, .none, .solid, .solid, .ladder, .none, .none, .solid, .solid, .solid, 
    .solid, .solid, .solid, .solid, .none, .none, .none, .none, .none, .none, .solid, .none, .none, .none, .none, .none, 
    .none, .none, .none, .none, .none, .none, .none, .none, .solid, .none, .none, .none, .none, .none, .none, .none, 
  },
};
