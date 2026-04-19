// OLED
use ssd1306::{I2CDisplayInterface, Ssd1306Async, prelude::*};

// Embedded Graphics
use embedded_graphics::{
    mono_font::{MonoTextStyleBuilder, ascii::FONT_6X10},
    pixelcolor::BinaryColor,
    prelude::Point,
    prelude::*,
    text::{Baseline, Text},
};
/*
struct Display
{
    
}

impl Display
{
    fn new() -> Display
    {
        let text_style = MonoTextStyleBuilder::new()
        .font(&FONT_6X10)
        .text_colo
    }
}*/