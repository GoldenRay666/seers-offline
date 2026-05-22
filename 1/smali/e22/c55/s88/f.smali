.class Le22/c55/s88/f;
.super Ljava/util/TimerTask;


# instance fields
.field final synthetic a:Le22/c55/s88/Vrr;


# direct methods
.method constructor <init>(Le22/c55/s88/Vrr;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/f;->a:Le22/c55/s88/Vrr;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/f;->a:Le22/c55/s88/Vrr;

    invoke-static {v0}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/f;->a:Le22/c55/s88/Vrr;

    invoke-static {v1}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le22/c55/s88/f/a;->b(Landroid/content/Context;)I

    move-result v1

    invoke-static {v0, v1}, Le22/c55/s88/Vss;->a(Landroid/content/Context;I)V

    return-void
.end method
