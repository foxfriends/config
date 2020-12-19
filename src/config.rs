use serde::{Deserialize, Serialize};
use std::collections::HashMap;
use std::path::PathBuf;

#[derive(Serialize, Deserialize)]
#[serde(untagged)]
enum Either<L, R> {
    Left(L),
    Right(R),
}

#[derive(Serialize, Deserialize)]
pub struct Config {
    #[serde(rename = "app")]
    apps: HashMap<String, AppConfig>,
}

#[derive(Serialize, Deserialize)]
pub struct AppConfig {
    path: Either<PathBuf, Paths>,
}

#[derive(Serialize, Deserialize)]
pub struct Paths {
    ubuntu: Option<PathBuf>,
    mac: Option<PathBuf>,
}
