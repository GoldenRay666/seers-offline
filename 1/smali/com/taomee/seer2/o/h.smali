.class Lcom/taomee/seer2/o/h;
.super Landroid/os/AsyncTask;


# instance fields
.field final synthetic a:Lcom/taomee/seer2/o/g;

.field private b:Ljava/lang/StringBuffer;

.field private c:Landroid/content/Context;

.field private d:I

.field private e:I


# direct methods
.method public constructor <init>(Lcom/taomee/seer2/o/g;Landroid/content/Context;II)V
    .locals 0

    iput-object p1, p0, Lcom/taomee/seer2/o/h;->a:Lcom/taomee/seer2/o/g;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/taomee/seer2/o/h;->c:Landroid/content/Context;

    iput p3, p0, Lcom/taomee/seer2/o/h;->d:I

    iput p4, p0, Lcom/taomee/seer2/o/h;->e:I

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/Void;)Lcom/taomee/seer2/o/b/e;
    .locals 4

    iget-object v0, p0, Lcom/taomee/seer2/o/h;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/taomee/seer2/o/c;->a(Landroid/content/Context;)Lcom/taomee/seer2/o/c;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v1, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/taomee/seer2/o/h;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/taomee/seer2/o/c/t;->g(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/taomee/seer2/o/h;->d:I

    const/16 v3, -0x3e9

    if-eq v2, v3, :cond_2

    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_0
    iget-object v1, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    iget v2, p0, Lcom/taomee/seer2/o/h;->d:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    iget v2, p0, Lcom/taomee/seer2/o/h;->e:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    :goto_0
    iget-object v1, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/taomee/seer2/o/c;->a(Ljava/lang/String;)Lcom/taomee/seer2/o/b/e;

    move-result-object v0

    if-eqz v0, :cond_1

    :cond_1
    return-object v0

    :cond_2
    iget-object v2, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method protected a(Lcom/taomee/seer2/o/b/e;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    if-eqz p1, :cond_1

    iget v0, p1, Lcom/taomee/seer2/o/b/e;->a:I

    if-eqz v0, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/taomee/seer2/o/h;->c:Landroid/content/Context;

    iget-object v0, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Lcom/taomee/seer2/o/c/t;->a(Landroid/content/Context;Ljava/lang/String;)V

    :cond_1
    return-void

    :cond_2
    iget-object v0, p0, Lcom/taomee/seer2/o/h;->b:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/taomee/seer2/o/h;->a([Ljava/lang/Void;)Lcom/taomee/seer2/o/b/e;

    move-result-object v0

    return-object v0
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/taomee/seer2/o/b/e;

    invoke-virtual {p0, p1}, Lcom/taomee/seer2/o/h;->a(Lcom/taomee/seer2/o/b/e;)V

    return-void
.end method
