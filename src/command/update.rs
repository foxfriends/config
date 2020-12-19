#[derive(structopt::StructOpt)]
pub struct Args {
    /// The app to update configs for. If omitted, updates all apps.
    app: Option<String>,
}
