#[derive(structopt::StructOpt)]
pub struct Args {
    /// Update apps that have already been installed also.
    #[structopt(short, long)]
    update: bool,
    /// The app to install configs for. If omitted, installs all apps.
    app: Option<String>,
}
