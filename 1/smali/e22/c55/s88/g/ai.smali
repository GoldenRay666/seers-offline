.class Le22/c55/s88/g/ai;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/g/ac;


# direct methods
.method constructor <init>(Le22/c55/s88/g/ac;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/ai;->a:Le22/c55/s88/g/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Le22/c55/s88/g/ai;->a:Le22/c55/s88/g/ac;

    invoke-static {v0}, Le22/c55/s88/g/ac;->d(Le22/c55/s88/g/ac;)Le22/c55/s88/e/j;

    move-result-object v0

    const/4 v1, 0x1

    iput-boolean v1, v0, Le22/c55/s88/e/j;->j:Z

    iget-object v0, p0, Le22/c55/s88/g/ai;->a:Le22/c55/s88/g/ac;

    iget-object v0, v0, Le22/c55/s88/g/ac;->b:Landroid/view/View;

    check-cast v0, Le22/c55/s88/g/l;

    sget-object v1, Le22/c55/s88/f/e;->P:Ljava/lang/String;

    invoke-virtual {v0, v1}, Le22/c55/s88/g/l;->h(Ljava/lang/String;)V

    return-void
.end method
